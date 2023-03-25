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
    if(currentNode.endNodeStatus && currentNode.getPageList() != []){
      List<int> p = currentNode.getPageList();
      for(var i in p){
        pageL.add(pages[i]);
      }
    }
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
    return (!currentNode.endNodeStatus)?SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageLink),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(40.0),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
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
                            }
                            );
                          },
                          child: Text(
                              l[0],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
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
                              if(currentNode.endNodeStatus && currentNode.getPageList() != []){
                                List<int> p = currentNode.getPageList();
                                for(var i in p){
                                  pageL.add(pages[i]);
                                }
                              }
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
      ),
    ):SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageLink),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.all(40.0),
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
                  (pageL.length>0)?Container(
                    height: 240,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Swiper(
                        itemCount: pageL.length,
                        fade: 0.3,
                        itemWidth: 300,
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Container(
                                      width: 300,
                                      child: Card(

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(32)),
                                        elevation: 8,
                                        color: Color(0xFFEE1756),
                                        child: Padding(
                                          padding: const EdgeInsets.all(32.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                          children: <Widget>[
                                            const SizedBox(
                                              height: 35,
                                            ),

                                            Text(
                                              pageL[index].name.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Avenir',
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.left,
                                            ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                right: 20,
                                top: 2,
                                child: Hero(
                                    tag: pageL[index].position,
                                    child: Image.asset(
                                      pageL[index].iconImage.toString(),
                                      height: 130,
                                      width: 130,
                                    )
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ):Container()

              ]),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new))
            ],
          )
      ),
    ));
  }


}