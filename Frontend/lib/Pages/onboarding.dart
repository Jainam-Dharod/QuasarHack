import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quaser_diagnostica/Pages/MainScreen.dart';

const items = [
  Color(0xffb63753),
  Color(0xff4da6a6),
  Color(0xffed78af),
  Color(0xffffffff),
];

const textPart = [
  "Find out what's causing your symptoms",
  "Learn how to provide efficient first-aid",
  "Get personalised nutrition and care plans",
];

// void main() {
//   runApp(
//     MaterialApp(
//       home: FlowPager(),
//     ),
//   );
// }

class FlowPager extends StatefulWidget {
  @override
  _FlowPagerState createState() => _FlowPagerState();
}

class _FlowPagerState extends State<FlowPager> {
  ValueNotifier<double> _notifier = ValueNotifier(0.0);
  final _button = GlobalKey();
  final _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      _notifier.value = _pageController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                // Custom Painter
                AnimatedBuilder(
                  animation: _notifier,
                  builder: (_, __) => CustomPaint(
                    painter: FlowPainter(
                      context: context,
                      notifier: _notifier,
                      target: _button,
                      colors: items,
                    ),
                  ),
                ),

                // PageView
                PageView.builder(
                  controller: _pageController,
                  itemCount: textPart.length,
                  itemBuilder: (c, i) => Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.15,
                              right: constraints.maxWidth * 0.1,
                              left: constraints.maxWidth * 0.1,
                              bottom: constraints.maxHeight * 0.04),
                          child: Text(
                            textPart[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.035,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,0,12,0),
                          child: Image(
                            image: AssetImage("assets/images/$i.png"),
                            height: constraints.maxHeight * 0.45,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.15,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                            },
                            child: Text(
                              'Get started >',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: constraints.maxHeight * 0.02,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // Anchor Button
                IgnorePointer(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                      EdgeInsets.only(bottom: constraints.maxHeight * 0.15),
                      child: ClipOval(
                        child: AnimatedBuilder(
                          animation: _notifier,
                          builder: (_, __) {
                            final animatorVal =
                                _notifier.value - _notifier.value.floor();
                            double opacity = 0, iconPos = 0;
                            int colorIndex;
                            if (animatorVal < 0.5) {
                              opacity = (animatorVal - 0.5) * -2;
                              iconPos = 70 * -animatorVal;
                              colorIndex = _notifier.value.floor() + 1;
                            } else {
                              colorIndex = _notifier.value.floor() + 2;
                              iconPos = -70;
                            }
                            if (animatorVal > 0.9) {
                              iconPos = -250 * (1 - animatorVal) * 10;
                              opacity = (animatorVal - 0.9) * 10;
                            }
                            colorIndex = colorIndex % items.length;
                            return SizedBox(
                              key: _button,
                              width: 70,
                              height: 70,
                              child: Transform.translate(
                                offset: Offset(iconPos, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: items[colorIndex],
                                  ),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color(0xff011627).withOpacity(opacity),
                                    size: 30,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class FlowPainter extends CustomPainter {
  final BuildContext context;
  final ValueNotifier<double> notifier;
  final GlobalKey target;
  final List<Color> colors;


  FlowPainter({required this.context,required this.notifier,required this.target,required this.colors});

  @override
  void paint(Canvas canvas, Size size) {

    RenderBox _renderBox = target.currentContext!.findRenderObject()  as RenderBox;
    final screen = MediaQuery.of(context).size;
    if (_renderBox == null)
      _renderBox = target.currentContext!.findRenderObject()  as RenderBox;
    if (_renderBox == null || notifier == null) return;
    final page = notifier.value.floor();
    final animatorVal = notifier.value - page;
    final targetPos = _renderBox.localToGlobal(Offset.zero);
    final xScale = screen.height * 8, yScale = xScale / 2;
    var curvedVal = Curves.easeInOut.transformInternal(animatorVal);
    final reverseVal = 1 - curvedVal;

    Paint buttonPaint = Paint(), bgPaint = Paint();
    Rect buttonRect, bgRect = Rect.fromLTWH(0, 0, screen.width, screen.height);

    if (animatorVal < 0.5) {
      bgPaint..color = colors[page % colors.length];
      buttonPaint..color = colors[(page + 1) % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx - (xScale * curvedVal), //left
        targetPos.dy - (yScale * curvedVal), //top
        targetPos.dx + _renderBox.size.width * reverseVal, //right
        targetPos.dy + _renderBox.size.height + (yScale * curvedVal), //bottom
      );
    } else {
      bgPaint..color = colors[(page + 1) % colors.length];
      buttonPaint..color = colors[page % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx + _renderBox.size.width * reverseVal, //left
        targetPos.dy - yScale * reverseVal, //top
        targetPos.dx + _renderBox.size.width + xScale * reverseVal, //right
        targetPos.dy + _renderBox.size.height + yScale * reverseVal, //bottom
      );
    }

    canvas.drawRect(bgRect, bgPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(buttonRect, Radius.circular(screen.height)),
      buttonPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}