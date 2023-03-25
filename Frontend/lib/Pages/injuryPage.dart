import 'package:quaser_diagnostica/Pages/SOS.dart';
import '/model/node.dart';
import '/model/injury.dart';
import 'results.dart';
import '/model/heart.dart';
import 'package:flutter/material.dart';

class InjuryPage extends StatefulWidget {
  const InjuryPage({Key? key}) : super(key: key);

  @override
  State<InjuryPage> createState() => _InjuryPageState();
}

class _InjuryPageState extends State<InjuryPage> {
  Node injury = new Node("", false);
  Node heart = new Node("", false);

  @override
  void initState() {
    injury = constructTreeInjury();
    heart = constructTreeHeart();
    super.initState();
  }

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
                        image: AssetImage('assets/physicalinjuryornot.png'),
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
                              'Is it a physical injury or pain without physical injury?',
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
                          Results.rootNode = injury;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Results()));
                        },
                        child: Text(
                          'It is a physical injury',
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
                          Results.rootNode = heart;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Results()));
                        },
                        child: Text(
                          'It is pain without injury',
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
