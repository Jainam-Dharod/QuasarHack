import '/model/node.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:quaser_diagnostica/model/datas.dart';
import 'package:quaser_diagnostica/Pages/detailsView.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {

  static Node rootNode = Node("",false,);
  @override
  State<Results> createState() => _ResultsState();
}
class _ResultsState extends State<Results> {
  Node currentNode = Results.rootNode;
  String imageLink = "" ;
  List<String> l = [];
  String comment = "", comment1 = "", comment2 = "" ;
  List<PageFile> pageL = [];


  @override
  void initState() {
    imageLink = currentNode.getIconImage();
    comment = currentNode.getComment();
    if(comment.contains('-')) {
      comment1 = comment.substring(0, comment.indexOf('-')+2);
      comment2 = comment.substring(comment.indexOf('-')+2);
    }
    else {
      comment1 = "";
      comment2 = comment;
    }
    l = currentNode.getResponses();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if ((!currentNode.endNodeStatus)) {
      return SafeArea(
      child: Scaffold(
        body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height * 0.6,
                    //width: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageLink),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    height: height * 0.06,
                    margin: const EdgeInsets.all(32.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              comment1,
                              style: const TextStyle(
                                fontSize: 16, color: Color(0xffEE1756), fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              comment2,
                              style: const TextStyle(
                                fontSize: 16, color: Colors.black,
                              ),
                            ),
                          )
                        ])
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.19,
                        width: width * 0.38,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xffEE1756)),
                          onPressed: () {
                            setState(() {
                              currentNode = currentNode.getNextNode(l[0])!;
                              imageLink = currentNode.getIconImage();
                              comment = currentNode.getComment();
                              if(comment.contains('-')) {
                                comment1 = comment.substring(0, comment.indexOf('-')+2);
                                comment2 = comment.substring(comment.indexOf('-')+2);
                              }
                              else {
                                comment1 = "";
                                comment2 = comment;
                              }
                              l = currentNode.getResponses();
                              if(currentNode.endNodeStatus && currentNode.getPageList() != []){
                                List<int> p = currentNode.getPageList();
                                for(var i in p){
                                  pageL.add(pages[i]);
                                }
                              }
                            });
                          },
                          child: Text(
                              l[0],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.19,
                        width: width * 0.38,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xffEE1756)),
                          onPressed: () {
                            setState(() {
                              currentNode = currentNode.getNextNode(l[1])!;
                              imageLink = currentNode.getIconImage();
                              comment = currentNode.getComment();
                              if(comment.contains('-')) {
                                comment1 = comment.substring(0, comment.indexOf('-')+2);
                                comment2 = comment.substring(comment.indexOf('-')+2);
                              }
                              else {
                                comment1 = "";
                                comment2 = comment;
                              }
                              l = currentNode.getResponses();
                            });
                          },
                          child: Text(
                            l[1],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new))
            ],
          ),

      ),
    );
    } else {
      return SafeArea(
      child: Scaffold(
        body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height * 0.6,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageLink),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(

                      height: height * 0.06,
                      margin: const EdgeInsets.fromLTRB(40.0,40.0,40.0,20.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comment1,
                              style: const TextStyle(
                                  fontSize: 16, color: Color(0xffEE1756), fontWeight: FontWeight.bold
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comment2,
                                style: const TextStyle(
                                  fontSize: 16, color: Colors.black,
                                ),
                              ),
                            )
                          ])
                  ),
                  //final pages
                  if (pageL.length>0) Container(
                    height: height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Swiper(
                        itemCount: pageL.length,
                        fade: 0.3,
                        itemWidth: width * 0.8,
                        layout: SwiperLayout.STACK,
                        pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                activeSize: 7,
                                activeColor: Colors.yellow.shade300,
                                space: 5)),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (context, a, b) => DetailsView(
                                      pageFile: pageL[index],
                                    ),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ));
                            },
                            child: Stack(
                              children: <Widget>[


                                    Container(

                                      width: width * 0.8,
                                      height: height * 0.2,
                                      child: Card(

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(32)),
                                        elevation: 8,
                                        color: Color(0xFFEE1756),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(24.0, 12.0, 12.0, 12.0),
                                          child:


                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    pageL[index].name.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Avenir',
                                                        color: Color(0xffFFFFFF),
                                                        fontWeight: FontWeight.w600),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Material(
                                                    elevation: 20,
                                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                                    child: Container(
                                                        child: Image.asset(

                                                          pageL[index].iconImage.toString(),

                                                          height: height* 0.4,
                                                          width: width * 0.4,
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),




                                      ),
                                    ),
                                  )
                                ],
                              ),


                        );
                      },
                    ),
                  ),
                ) else Container()

              ]),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new))
            ],
          )

    ));
    }
  }


}