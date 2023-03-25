import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SosPage extends StatefulWidget {
  const SosPage({Key? key}) : super(key: key);


  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  final Uri _url = Uri.parse('tel:+91 9822048479');
  Future<void> _makePhoneCall() async {
    await launchUrl(_url);
  }
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
                    image: AssetImage("assets/SOS.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 310,
                child: CircleAvatar(
                    radius: 160,
                    backgroundColor: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _makePhoneCall();

                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Align(

                  alignment: Alignment.bottomCenter,
                  child: SizedBox(

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
                        Navigator.pop(context);
                      },
                      child: Text('CANCEL'),
                    ),
                  ),
                ),
              )
            ])
    );
  }
}
