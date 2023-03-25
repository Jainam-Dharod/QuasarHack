import 'package:quaser_diagnostica/Pages/SOS.dart';
import 'bodyPage.dart';
import 'assistancePage.dart';
import '/model/node.dart';
import 'package:flutter/material.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height*0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/emergencyornot.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                      height: height * 0.06,
                      margin: const EdgeInsets.all(32.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(

                              child: Text(
                                'Is this an emergency? If so you can press yes and we will get you help immediately',
                                style: const TextStyle(
                                  fontSize: 16, color: Colors.black,
                                ),
                              ),
                            )
                          ])
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.19,
                        width: width * 0.38,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xffEE1756)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AssistancePage()));
                          },
                          child: Text(
                            'Yes',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.19,
                        width: width * 0.38,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xffEE1756)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BodyPage()));
                          },
                          child: Text(
                            'No',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new))
            ],
          )
      ),
    );
  }
}
