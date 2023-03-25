import 'package:flutter/material.dart';
import 'package:quaser_diagnostica/Pages/results.dart';
import 'package:quaser_diagnostica/model/chest.dart';
import 'package:quaser_diagnostica/model/headache.dart';
import 'package:quaser_diagnostica/model/tooth.dart';

import '../model/heart.dart';
import '../model/injury.dart';
import '../model/node.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Node teeth = Node("",false);
  Node chest = Node("",false);
  Node headache = Node("",false);
  Node heart = Node("",false);
  Node injury = Node("",false);

  @override
  void initState() {
    teeth = constructTreeTeeth();
    chest = constructTreeChest();
    headache = constructTreeHead();
    heart = constructTreeHeart();
    injury = constructTreeInjury();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                // boxShadow: [
                //   BoxShadow(color: Colors.blueGrey, spreadRadius: 3),
                // ],
                color: Colors.grey,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:EdgeInsets.fromLTRB(5, 10, 10, 0),
                    child: Row(children: [
                      CircleAvatar(
                        radius:25,
                        backgroundImage:
                        NetworkImage('https://picsum.photos/id/237/200/300'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning,',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'User',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ), Expanded(child: Container()),
                      CircleAvatar(
                        radius:20,
                        backgroundImage:
                        NetworkImage('https://picsum.photos/id/237/200/300'),
                      ),
                    ],),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    padding:EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text(
                      'How Are You Feeling Today?',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Expanded(child: Container()),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: MediaQuery.of(context).size.height * 0.069,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                            MediaQuery.of(context).size.height * 0.024,
                          ),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.5)),
                            contentPadding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.height * 0.014,
                                MediaQuery.of(context).size.width * 0.014,
                                0,
                                MediaQuery.of(context).size.width * 0.014),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.mic,
                                color: Colors.black,
                                size:
                                MediaQuery.of(context).size.height * 0.027,
                              ),
                              onPressed: () {

                              },
                            ),
                            labelText: 'Text Input',
                            labelStyle: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.height * 0.02,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: (value) {

                          },
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20,)
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Your Body',
                            style: TextStyle(fontSize: 15),
                          ),
                          Expanded(child: Container()),
                          CircleAvatar(
                            radius:20,
                            backgroundImage:
                            NetworkImage('https://picsum.photos/id/237/200/300'),
                          ),
                        ],),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child:  GridView.count(
                                primary: false,
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                children: <Widget>[
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {
                                      Results.rootNode = headache;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Results()));
                                    }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/foreheadIcon.png',),
                                      Text('ForeHead',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {  }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/eyesIcon.png'),
                                      Text('Eye',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {
                                      Results.rootNode = teeth;

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Results()));
                                    }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/teethIcon.png'),
                                      Text('Teeth',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {
                                      Results.rootNode = chest;

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Results()));
                                    }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/chestIcon.png'),
                                      Text('Chest',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {  }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/earIcon.png'),
                                      Text('Ear',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {  }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/noseIcon.png'),
                                      Text('Nose',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {  }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/heartIcon.png'),
                                      Text('Heart',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {  }, child: Stack(

                                    children: <Widget>[
                                      Image.asset('assets/obgynIcon.png'),
                                      Text('OBGYN',style: TextStyle(
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),),

                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(child: Container(),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.062,
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SosPage()));
                              },
                              child: Text('SOS'),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.062,
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => EmergencyPage()));
                              },
                              child: Text('START'),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

