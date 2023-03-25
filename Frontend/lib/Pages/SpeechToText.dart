import 'package:flutter/material.dart';
import 'package:quaser_diagnostica/Pages/sttPage.dart';

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({Key? key}) : super(key: key);


  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {


  IconData mics = Icons.mic_off;
  String _Words = 'Tap the microphone to start listening...';
  int tap=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 180.0),
              child: Text(
                'SPEECH TO TEXT SOS:',
                style: TextStyle(
                    fontSize: 26.0,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                   _Words

                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.center,
        child: Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.only(left: 42.0),
          child: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed:(){
              setState(() {
                mics = Icons.mic;
                _Words= 'Listening';
                tap++;
                if(tap%2==0 && tap!=0){
                  mics = Icons.mic_off;
                  _Words= 'Tap the microphone to start listening...';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sttPage()));

                }
              });




            },
            // If not yet listening for speech start, otherwise stop



            child: new Icon(mics, size:70),
          ),
        ),
      ),
    );
  }
}

