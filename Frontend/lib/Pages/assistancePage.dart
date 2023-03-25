import 'package:quaser_diagnostica/Pages/SOS.dart';
import 'package:quaser_diagnostica/Pages/injuryPage.dart';

import '/model/node.dart';
import 'package:flutter/material.dart';

class AssistancePage extends StatefulWidget {
  const AssistancePage({Key? key}) : super(key: key);

  @override
  State<AssistancePage> createState() => _AssistancePageState();
}

class _AssistancePageState extends State<AssistancePage> {
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
                    height: height  * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/emergencynode.png'),
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
                                'Are you assisting a patient or are you in need of assistance?',
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
                                    builder: (context) => InjuryPage()));
                          },
                          child: Text(
                            'I am assisting',
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
                                    builder: (context) => SosPage()));
                          },
                          child: Text(
                            'I am the Patient',
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
