import 'package:flutter/material.dart';
import 'package:quaser_diagnostica/Pages/HospitalPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';


class SosPage extends StatefulWidget {
  const SosPage({Key? key}) : super(key: key);


  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> with TickerProviderStateMixin{

  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [

              Container(

                height: height * 0.7,
                width: width * 1,
                child: Center(
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Container(
                        height: height * 0.28,
                        width: width * 0.55,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0 * animationController.value),
                          child: child,
                        ),
                      );
                    },
                    child: Container(

                      decoration: BoxDecoration(
                          color: Color(0xffEE1756),
                          borderRadius: BorderRadius.circular(100)

                      ),
                          child: IconButton(
                        onPressed: () {},
                        color: Colors.black,
                        icon: Icon(Icons.phone, size: 90),
                      ),
                    ),
                  ),


                ),


              ),
              Container(
                height: height * 0.08,
                width: width * 0.5,
                child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('CANCEL'),
                          ),
              ),


            ],
          )

      ),
    );
  }
  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HospitalPage()
    )
    );
  }

}
