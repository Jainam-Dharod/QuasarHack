import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quaser_diagnostica/Pages/results.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;

import '../model/node.dart';

class sttPage extends StatefulWidget {
  const sttPage({Key? key}) : super(key: key);

  @override
  State<sttPage> createState() => _sttPageState();
}

class _sttPageState extends State<sttPage> {
  bool _hasSpeech = false;
  bool _logEvents = false;
  bool _onDevice = false;
  final TextEditingController _pauseForController =
  TextEditingController(text: '3');
  final TextEditingController _listenForController =
  TextEditingController(text: '30');
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    _logEvent('Initialize');
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: _logEvents,
      );
      if (hasSpeech) {
        // Get the list of languages installed on the supporting platform so they
        // can be displayed in the UI for selection by the user.
        _localeNames = await speech.locales();

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? 'en_GB';
      }
      if (!mounted) return;

      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        _hasSpeech = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(


            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      iconSize: 35,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.07,
              ),

              speech.isListening? Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                height: height * 0.15,
                width: width * 0.85,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://icons8.com/vue-static/landings/animated-icons/icons/sound/sound_200.gif'),
                    fit: BoxFit.fill,
                ),
                ),
              ):Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                height: height * 0.15,
                width: width * 0.85,

                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(

                      'Please click on the mic button to start recording',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,

                      ),
                    ),
                  ),
                ),
              ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            height: height * 0.2,
            width: width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

            ),

            child: Center(
              child: Text(
                lastWords,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22
                ),
              ),
            ),
          ),
              SizedBox(
                height: height * 0.03,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpeechControlWidget(_hasSpeech, speech.isListening,
                  startListening, stopListening, cancelListening),

              Material(
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Container(
                  height: height * 0.12,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                      color: Color(0xffEE1756),
                      borderRadius: BorderRadius.circular(100)


                  ),
                  child: IconButton(

                    onPressed: () async{
                      const url = 'https://e1dd-14-140-90-130.in.ngrok.io/prediction';
                      final response = await http.post(url, body: json.encode({'text' : lastWords}));
                      Map<String, dynamic> temp = json.decode(response.body);
                      print(temp["disease"]);
                      Node heartAttackNode = new Node("Current Prediction - Heart Attack. This is a critical situation. Please call the ambulance immediately using the SOS button. Have the person sit down, rest, and try to keep calm. Loosen any tight clothing. Ask if the person takes any chest pain medicine, such as nitroglycerin for a known heart condition, and help them take it.", true, iconImage:"assets/temp4.png");
                      Node coldNode = Node("Current Prediction - Cold", true,pageList: [5,4,2,1], iconImage:"assets/temp7.png");
                      Node pneumoNode = Node("Current Prediction - Pneumonia", true, pageList: [3,2], iconImage:"assets/temp5.png");
                      if(temp["disease"]=="Heart attack"){
                        Results.rootNode = heartAttackNode;
                      }
                      else if(temp["disease"]=="Common Cold"){
                        Results.rootNode = coldNode;

                      }
                      else if(temp["disease"]=="Pneumonia"){
                        Results.rootNode = pneumoNode;
                      }
                      else{
                        Results.rootNode = Node("Current Prediction - Mild Discomfort", true, iconImage:"assets/temp1.png");
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Results()));

                      },
                    icon: Icon(Icons.search, size: 50),),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

void startListening() {
  _logEvent('start listening');
  lastWords = '';
  lastError = '';
  final pauseFor = int.tryParse(_pauseForController.text);
  final listenFor = int.tryParse(_listenForController.text);
  // Note that `listenFor` is the maximum, not the minimun, on some
  // systems recognition will be stopped before this value is reached.
  // Similarly `pauseFor` is a maximum not a minimum and may be ignored
  // on some devices.
  speech.listen(
    onResult: resultListener,
    listenFor: Duration(seconds: listenFor ?? 30),
    pauseFor: Duration(seconds: pauseFor ?? 3),
    partialResults: true,
    localeId: _currentLocaleId,
    onSoundLevelChange: soundLevelListener,
    cancelOnError: true,
    listenMode: ListenMode.confirmation,
    onDevice: _onDevice,
  );
  setState(() {});
}

void stopListening() {
  _logEvent('stop');
  speech.stop();
  setState(() {
    level = 0.0;
  });
}

void cancelListening() {
  _logEvent('cancel');
  speech.cancel();
  setState(() {
    level = 0.0;
  });
}

/// This callback is invoked each time new recognition results are
/// available after `listen` is called.
void resultListener(SpeechRecognitionResult result) {
  _logEvent(
      'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
  setState(() {
    lastWords = '${result.recognizedWords} - ${result.finalResult}';
  });
}

void soundLevelListener(double level) {
  minSoundLevel = min(minSoundLevel, level);
  maxSoundLevel = max(maxSoundLevel, level);
  // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
  setState(() {
    this.level = level;
  });
}

void errorListener(SpeechRecognitionError error) {
  _logEvent(
      'Received error status: $error, listening: ${speech.isListening}');
  setState(() {
    lastError = '${error.errorMsg} - ${error.permanent}';
  });
}

void statusListener(String status) {
  _logEvent(
      'Received listener status: $status, listening: ${speech.isListening}');
  setState(() {
    lastStatus = '$status';
  });
}

  void _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }

void _logEvent(String eventDescription) {
  if (_logEvents) {
    var eventTime = DateTime.now().toIso8601String();
    print('$eventTime $eventDescription');
  }
}

void _switchLogging(bool? val) {
  setState(() {
    _logEvents = val ?? false;
  });
}

void _switchOnDevice(bool? val) {
  setState(() {
    _onDevice = val ?? false;
  });
}
}



/// Displays the most recently recognized words and the sound level.
// class RecognitionResultsWidget extends StatelessWidget {
//   const RecognitionResultsWidget({
//     Key? key,
//     required this.lastWords,
//     required this.level,
//   }) : super(key: key);
//
//   final String lastWords;
//   final double level;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Center(
//           child: Text(
//             'Recognized Words',
//             style: TextStyle(fontSize: 22.0),
//           ),
//         ),
//         Expanded(
//           child: Stack(
//             children: <Widget>[
//               Row(
//                 children: [
//                   Container(
//                     color: Theme.of(context).selectedRowColor,
//                     child: Center(
//                       child: Text(
//                         lastWords,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//
//                   FloatingActionButton(
//                     onPressed: (){},
//                     child: Icon(Icons.search),
//                   ),
//                 ],
//               ),
//               Positioned.fill(
//                 bottom: 10,
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             blurRadius: .26,
//                             spreadRadius: level * 1.5,
//                             color: Colors.black.withOpacity(.05))
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(50)),
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.mic),
//                       onPressed: () => null,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


/// Display the current error status from the speech
/// recognizer
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
    required this.lastError,
  }) : super(key: key);

  final String lastError;

  @override
  Widget build(BuildContext context) {
    return Column(
    );
  }
}

/// Controls to start and stop speech recognition
class SpeechControlWidget extends StatelessWidget {
  const SpeechControlWidget(this.hasSpeech, this.isListening,
      this.startListening, this.stopListening, this.cancelListening,
      {Key? key})
      : super(key: key);

  final bool hasSpeech;
  final bool isListening;
  final void Function() startListening;
  final void Function() stopListening;
  final void Function() cancelListening;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Container(
        height: height * 0.12,
        width: width * 0.25,
        decoration: BoxDecoration(
            color: Color(0xffEE1756),
            borderRadius: BorderRadius.circular(100)


        ),
        child: IconButton(
          onPressed: !hasSpeech || isListening ? null : startListening,
          icon: Icon(Icons.mic, size: 45),
        ),
      ),
    );
  }
}

class SessionOptionsWidget extends StatelessWidget {
  const SessionOptionsWidget(
      this.currentLocaleId,
      this.switchLang,
      this.localeNames,
      this.logEvents,
      this.switchLogging,
      this.pauseForController,
      this.listenForController,
      this.onDevice,
      this.switchOnDevice,
      {Key? key})
      : super(key: key);

  final String currentLocaleId;
  final void Function(String?) switchLang;
  final void Function(bool?) switchLogging;
  final void Function(bool?) switchOnDevice;
  final TextEditingController pauseForController;
  final TextEditingController listenForController;
  final List<LocaleName> localeNames;
  final bool logEvents;
  final bool onDevice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}

class InitSpeechWidget extends StatelessWidget {
  const InitSpeechWidget(this.hasSpeech, this.initSpeechState, {Key? key})
      : super(key: key);

  final bool hasSpeech;
  final Future<void> Function() initSpeechState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextButton(
          onPressed: hasSpeech ? null : initSpeechState,
          child: Text('Initialize'),
        ),
      ],
    );
  }
}


