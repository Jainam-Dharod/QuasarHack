import '/model/chest.dart';
import '/model/headache.dart';
import '/model/heart.dart';
import '/model/injury.dart';
import 'package:flutter/material.dart';
import '../model/node.dart';
import 'results.dart';
import '/model/tooth.dart';

class BodyPage extends StatelessWidget{
  Node teeth = Node("",false);
  Node chest = Node("",false);
  Node headache = Node("",false);
  Node heart = Node("",false);
  Node injury = Node("",false);

  BodyPage(){
    teeth = constructTreeTeeth();
    chest = constructTreeChest();
    headache = constructTreeHead();
    heart = constructTreeHeart();
    injury = constructTreeInjury();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Container(
              child: Ink.image(
                image: AssetImage('assets/human.png'),
                fit: BoxFit.cover,
                width: 400,
                height: 700,
              ),

            ),
          ),
          Positioned(
            left: 10,
            top: 70,
            child: Container(
                width: 120,
                height: 50,
                color: Colors.transparent,

                child: InkWell(
                  onTap: () {
                    Results.rootNode = headache;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results()));
                  },
                )),
          ),
          Positioned(
            right: 2,
            top: 190,

            child: Container(
                width: 90,
                height: 50,
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.brown,
                  onTap: () {
                    Results.rootNode = chest;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results()));
                  },
                )),
          ),
          Positioned(
            left: 5,
            top: 220,
            child: Container(
                width: 70,
                height: 50,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print("arms");
                  },
                )),
          ),
          Positioned(
            right: 2,
            top: 120,
            child: Container(
                width: 120,
                height: 50,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {

                    Results.rootNode = teeth;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results()));

                  },
                )),
          ),
          Positioned(
            right: 2,
            top: 57,
            child: Container(
                width: 120,
                height: 50,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print("nose");
                  },
                )),
          ),
        ],
      ),
    );
  }
}