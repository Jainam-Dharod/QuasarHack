import 'package:flutter/material.dart';

class sttPage extends StatelessWidget {
  const sttPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/emergenct.png'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}
