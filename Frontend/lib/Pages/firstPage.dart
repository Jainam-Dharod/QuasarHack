import 'package:quaser_diagnostica/Pages/SOS.dart';
import 'package:flutter/material.dart';
import 'emergency.dart';

class FirstPage extends StatelessWidget{
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children:[
          Container(

            //margin: EdgeInsets.only(top:50.0),
            decoration: BoxDecoration(
              color: Color(0xFFF3F3F3),
              image: DecorationImage(
                image: AssetImage("assets/firstpage.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                    SizedBox(
                      height: 70,
                      width: 150,

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
                    height: 70,
                    width: 150,
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
                                builder: (context) => EmergencyPage()));
                      },
                      child: Text('START'),
                    ),
                  )

                ],
              )
            ),
          )
        ],

      ),
    );
  }


}