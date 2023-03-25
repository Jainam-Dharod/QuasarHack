import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Pages/mainScreen.dart';
import 'Pages/bodyPage.dart';
import 'Pages/firstPage.dart';
import 'Pages/SOS.dart';
import 'Pages/SpeechToText.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Diagnostica',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: FirstPage());
  }
}
