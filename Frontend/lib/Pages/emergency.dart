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
    return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/emergencyornot.png'),
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                    margin: const EdgeInsets.all(40.0),
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
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
                      height: 150,
                      width: 150,
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
    );
  }
}
