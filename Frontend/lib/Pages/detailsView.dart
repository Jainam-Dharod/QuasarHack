import 'package:flutter/material.dart';

import 'package:quaser_diagnostica/model/datas.dart';
import 'package:quaser_diagnostica/model/constants.dart';

class DetailsView extends StatefulWidget {
  final PageFile? pageFile;
  const DetailsView({super.key, this.pageFile});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 250,
                ),
                Text(
                  widget.pageFile!.name.toString(),
                  style: TextStyle(
                      fontSize: 55,
                      fontFamily: 'Avenir',
                      color: primaryTextColor,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: Colors.black26,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width * 1.3,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Text(
                      widget.pageFile!.description.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Avenir',
                          color: contentTextColor,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                      maxLines: 60,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: Colors.black26,
                ),
                const SizedBox(
                  height: 15,
                ),

                const SizedBox(
                  height: 15,
                ),

              ],
            ),
          ),
        ),
        Positioned(
            right: -40,
            child: Hero(
                tag: widget.pageFile!.position,
                child: Image.asset(widget.pageFile!.iconImage.toString()))),

        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new))
          ],
        ),
      ),
    );
  }
}
