import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quaser_diagnostica/Pages/injuryPage.dart';
import 'package:quaser_diagnostica/Pages/results.dart';
import 'package:quaser_diagnostica/Pages/SOS.dart';
import 'package:quaser_diagnostica/Pages/sttPage.dart';
import 'package:quaser_diagnostica/model/chest.dart';
import 'package:quaser_diagnostica/model/headache.dart';
import 'package:quaser_diagnostica/model/tooth.dart';
import 'package:http/http.dart' as http;
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
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.38,
              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                // boxShadow: [
                //   BoxShadow(color: Colors.blueGrey, spreadRadius: 3),
                // ],
                //color: Color(0xffEE1756).withOpacity(0.2),
                color: Colors.teal.withOpacity(0.2),

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
                        AssetImage('assets/user.jpg'),
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
                        AssetImage('assets/heartlogo.jpg'),
                      ),
                    ],),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    padding:EdgeInsets.fromLTRB(10, 25, 10, 0),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => sttPage()));
                              },
                            ),
                            labelText: 'Text Input',
                            labelStyle: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.height * 0.02,
                              color: Colors.black,
                            ),
                          ),
                          onSubmitted: (value) async{
                            const url = 'https://e1dd-14-140-90-130.in.ngrok.io/prediction';
                            final response = await http.post(url, body: json.encode({'text' : value}));
                            Map<String, dynamic> temp = json.decode(response.body);

                            Node heartAttackNode = new Node("Current Prediction - Heart Attack. Please call the ambulance. Have the person sit down and loosen any tight clothing. Ask if the person takes any chest pain medicine, such as nitroglycerin for a known heart condition, and help them take it.", true, iconImage:"assets/temp4.png");
                            Node coldNode = Node("Current Prediction - Cold", true,pageList: [5,4,2,], iconImage:"assets/temp7.png");
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
                            Results.rootNode = Node("Condition Critical Call SOS", true, iconImage:"assets/emergencynode.png");
                            }
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => Results()));

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
              height: MediaQuery.of(context).size.height * 0.53,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Row(children: [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Your Body',
                            style: TextStyle(fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffEE1756).withOpacity(0.2),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 14),
                                Icon(
                                    Icons.circle_rounded,
                                    color: Colors.pinkAccent,
                                    size: 7
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Education',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(width: 14)




                              ],),
                          ),
                        ]),),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.36,
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
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {
                                      Results.rootNode = headache;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Results()));
                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        //width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/foreheadIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Forehead',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {

                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        //width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/noseIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Nose',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

                                    ],
                                  ),),

                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {
                                      Results.rootNode = teeth;

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Results()));
                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        //width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/teethIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Teeth',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

                                    ],
                                  ),

                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {
                                      Results.rootNode = chest;

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Results()));
                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        //width: 400,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/chestIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Chest',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {

                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        //width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/eyesIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Eye',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {

                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        //width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/earIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Ear',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {

                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        //width: 400,
                                        decoration: BoxDecoration(

                                            image: DecorationImage(
                                              image: AssetImage('assets/heartIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Heart',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

                                    ],
                                  ),),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            )
                                        )
                                    ),
                                    // style:  ElevatedButton.styleFrom(
                                    //   primary: Colors.white,
                                    // ),
                                    onPressed: () {
                                    }, child: Stack(
                                    children: <Widget>[
                                      Container(
                                        //width: 400,
                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/ongynIcon.png'),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      // Image.asset('assets/foreheadIcon.png',),
                                      Column(
                                        children: [
                                          Expanded(child: Container()),
                                          Material(
                                            elevation: 2,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white.withOpacity(0.5),
                                            child: Container(

                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.06),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(

                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                                    padding: EdgeInsets.fromLTRB(8 , 12, 8, 8),
                                                    child: Text('Urinary',style: TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  ),
                                                  CircleAvatar(
                                                    radius:15,
                                                    backgroundImage:
                                                    AssetImage('assets/arrow.jpg'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: 15
                                          )
                                        ],
                                      ),

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
                                  primary: Colors.teal,
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SosPage()));
                              },
                              child: Text('SOS'),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.062,
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal,
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InjuryPage()));
                              },
                              child: Text('ASSIST'),
                            ),
                          )
                        ],
                      ),
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



// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:quaser_diagnostica/Pages/assistancePage.dart';
// import 'package:quaser_diagnostica/Pages/results.dart';
// import 'package:quaser_diagnostica/Pages/SOS.dart';
// import 'package:quaser_diagnostica/Pages/sttPage.dart';
// import 'package:quaser_diagnostica/model/chest.dart';
// import 'package:quaser_diagnostica/model/headache.dart';
// import 'package:quaser_diagnostica/model/tooth.dart';
// import 'package:http/http.dart' as http;
// import '../model/heart.dart';
// import '../model/injury.dart';
// import '../model/node.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   Node teeth = Node("",false);
//   Node chest = Node("",false);
//   Node headache = Node("",false);
//   Node heart = Node("",false);
//   Node injury = Node("",false);
//
//   @override
//   void initState() {
//     teeth = constructTreeTeeth();
//     chest = constructTreeChest();
//     headache = constructTreeHead();
//     heart = constructTreeHeart();
//     injury = constructTreeInjury();
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height*0.4,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
//                 // boxShadow: [
//                 //   BoxShadow(color: Colors.blueGrey, spreadRadius: 3),
//                 // ],
//                 color: Colors.grey,
//
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding:EdgeInsets.fromLTRB(5, 10, 10, 0),
//                     child: Row(children: [
//                       CircleAvatar(
//                         radius:25,
//                         backgroundImage:
//                         NetworkImage('https://picsum.photos/id/237/200/300'),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Good Morning,',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                           Text(
//                             'User',
//                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ), Expanded(child: Container()),
//                       CircleAvatar(
//                         radius:20,
//                         backgroundImage:
//                         NetworkImage('https://picsum.photos/id/237/200/300'),
//                       ),
//                     ],),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width*0.75,
//                     padding:EdgeInsets.fromLTRB(10, 20, 10, 0),
//                     child: Text(
//                       'How Are You Feeling Today?',
//                       style: TextStyle(fontSize: 40),
//                     ),
//                   ),
//                   Expanded(child: Container()),
//                   Wrap(
//                     direction: Axis.horizontal,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         height: MediaQuery.of(context).size.height * 0.069,
//                         child: TextField(
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize:
//                             MediaQuery.of(context).size.height * 0.024,
//                           ),
//                           cursorColor: Colors.black,
//                           decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(10)),
//                                 borderSide: BorderSide(
//                                     color: Colors.black, width: 1.5)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(10)),
//                                 borderSide: BorderSide(
//                                     color: Colors.black, width: 1.5)),
//                             contentPadding: EdgeInsets.fromLTRB(
//                                 MediaQuery.of(context).size.height * 0.014,
//                                 MediaQuery.of(context).size.width * 0.014,
//                                 0,
//                                 MediaQuery.of(context).size.width * 0.014),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 Icons.mic,
//                                 color: Colors.black,
//                                 size:
//                                 MediaQuery.of(context).size.height * 0.027,
//                               ),
//                               onPressed: () {
//




//                               },
//                             ),
//                             labelText: 'Text Input',
//                             labelStyle: TextStyle(
//                               fontSize:
//                               MediaQuery.of(context).size.height * 0.02,
//                               color: Colors.black,
//                             ),
//                           ),
//                           onSubmitted: (value) async{
//                             const url = 'https://e1dd-14-140-90-130.in.ngrok.io/prediction';
//                             final response = await http.post(url, body: json.encode({'text' : value}));
//                             Map<String, dynamic> temp = json.decode(response.body);
//
//                             Node heartAttackNode = new Node("Current Prediction - Heart Attack. This is a critical situation. Please call the ambulance immediately using the SOS button. Have the person sit down, rest, and try to keep calm. Loosen any tight clothing. Ask if the person takes any chest pain medicine, such as nitroglycerin for a known heart condition, and help them take it.", true, iconImage:"assets/temp4.png");
//                             Node coldNode = Node("Current Prediction - Cold", true,pageList: [5,4,2,1], iconImage:"assets/temp7.png");
//                             Node pneumoNode = Node("Current Prediction - Pneumonia", true, pageList: [3,2], iconImage:"assets/temp5.png");
//                             if(temp["disease"]=="Heart attack"){
//                             Results.rootNode = heartAttackNode;
//                             }
//                             else if(temp["disease"]=="Common Cold"){
//                             Results.rootNode = coldNode;
//
//                             }
//                             else if(temp["disease"]=="Pneumonia"){
//                             Results.rootNode = pneumoNode;
//                             }
//                             else{
//                             Results.rootNode = Node("Current Prediction - Mild Discomfort", true, iconImage:"assets/temp1.png");
//                             }
//                             Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                             builder: (context) => Results()));
//
//                             },
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(height: 20,)
//                 ],
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
//                         child: Row(children: [
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'Your Body',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                           Expanded(child: Container()),
//                           CircleAvatar(
//                             radius:20,
//                             backgroundImage:
//                             NetworkImage('https://picsum.photos/id/237/200/300'),
//                           ),
//                         ],),
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.35,
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: Container(
//                             height: MediaQuery.of(context).size.height,
//                             child:  GridView.count(
//                                 primary: false,
//                                 padding: const EdgeInsets.all(20),
//                                 crossAxisSpacing: 10,
//                                 mainAxisSpacing: 10,
//                                 crossAxisCount: 2,
//                                 children: <Widget>[
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {
//                                       Results.rootNode = headache;
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Results()));
//                                     }, child: Stack(
//                                     children: <Widget>[
//                                       Container(
//                                         child: Image.asset('assets/foreheadIcon.png',),
//                                       ),
//
//                                       Container(
//                                         child: Column(
//                                           children: [
//                                             Expanded(child: Container()),
//                                             Text('ForeHead',style: TextStyle(
//                                               color: Colors.black,
//                                             ),),
//                                           ],
//                                         ),
//                                       ),
//
//                                     ],
//                                   ),),
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {  }, child: Stack(
//
//                                     children: <Widget>[
//                                       Image.asset('assets/eyesIcon.png'),
//                                       Text('Eye',style: TextStyle(
//                                         color: Colors.black,
//                                       ),),
//
//                                     ],
//                                   ),),
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {
//                                       Results.rootNode = teeth;
//
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Results()));
//                                     }, child: Stack(
//
//                                     children: <Widget>[
//                                       Image.asset('assets/teethIcon.png'),
//                                       Text('Teeth',style: TextStyle(
//                                         color: Colors.black,
//                                       ),),
//
//                                     ],
//                                   ),),
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {
//                                       Results.rootNode = chest;
//
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Results()));
//                                     }, child: Stack(
//
//                                     children: <Widget>[
//                                       Image.asset('assets/chestIcon.png'),
//                                       Text('Chest',style: TextStyle(
//                                         color: Colors.black,
//                                       ),),
//
//                                     ],
//                                   ),),
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {  }, child: Stack(
//
//                                     children: <Widget>[
//                                       Image.asset('assets/earIcon.png'),
//                                       Text('Ear',style: TextStyle(
//                                         color: Colors.black,
//                                       ),),
//
//                                     ],
//                                   ),),
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {  }, child: Stack(
//
//                                     children: <Widget>[
//                                       Image.asset('assets/noseIcon.png'),
//                                       Text('Nose',style: TextStyle(
//                                         color: Colors.black,
//                                       ),),
//
//                                     ],
//                                   ),),
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {  }, child: Stack(
//
//                                     children: <Widget>[
//                                       Image.asset('assets/heartIcon.png'),
//                                       Text('Heart',style: TextStyle(
//                                         color: Colors.black,
//                                       ),),
//
//                                     ],
//                                   ),),
//                                   ElevatedButton(
//                                     style:  ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                     ),
//                                     onPressed: () {  }, child: Stack(
//
//                                     children: <Widget>[
//                                       Image.asset('assets/ongynIcon.png'),
//                                       Text('OBGYN',style: TextStyle(
//                                         color: Colors.black,
//                                       ),),
//
//                                     ],
//                                   ),),
//                                 ]
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Expanded(child: Container(),),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.062,
//                             width: MediaQuery.of(context).size.width * 0.28,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.grey,
//                                   textStyle: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600)
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => SosPage()));
//                               },
//                               child: Text('SOS'),
//                             ),
//                           ),
//
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.062,
//                             width: MediaQuery.of(context).size.width * 0.28,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.grey,
//                                   textStyle: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600)
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => AssistancePage()));
//                               },
//                               child: Text('START'),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10,)
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
