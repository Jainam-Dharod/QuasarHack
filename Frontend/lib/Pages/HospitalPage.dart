import 'package:flutter/material.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(



        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  height: height*0.5,
                  width: width * 0.85,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage("assets/map.png"),
                      fit: BoxFit.cover

    ),
                ),
                ),

              ],

            ),
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 20, 10, 5),
                  height: height * 0.07,
                  width: width * 0.14,

                  decoration: BoxDecoration(
                    color: Color(0xffEE1756),
                    borderRadius: BorderRadius.circular(100)

                    ),
                    child: IconButton(
                    onPressed: () {},
                    color: Colors.black,
                    icon: Icon(Icons.my_location, size: 24),
                    ),

                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 20, 0, 5),
                  height: height * 0.07,
                  width: width * 0.62,

                  child: Center(child: Text('Vasantdada Patil Pratishthan\'s College of Engineering and visual arts')),
                ),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 20, 10, 5),
                  height: height * 0.07,
                  width: width * 0.14,

                  decoration: BoxDecoration(
                      color: Color(0xffEE1756),
                      borderRadius: BorderRadius.circular(100)

                  ),
                  child: IconButton(
                    onPressed: () {},
                    color: Colors.black,
                    icon: Icon(Icons.add_location_alt_rounded, size: 24),
                  ),

                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 20, 0, 5),
                  height: height * 0.07,
                  width: width * 0.62,
                  child: Center(child: Text('Sion Hospital, off Eastern Express Highway, Mumbai, Maharashtra')),
                ),


              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: height * 0.08,
                  width: width * 0.85,

                  decoration: BoxDecoration(
                    color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(child: Text('Help is on the way!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                  ),

                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
