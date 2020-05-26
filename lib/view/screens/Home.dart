import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/utils/bgPainter.dart';
import 'package:flutter_web_portfolio/utils/breakpoint.dart';
import 'package:flutter_web_portfolio/utils/cursor.dart';
import 'package:flutter_web_portfolio/view/widgets/HeroBtn.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  final navItems = ["Home", "Portfolio", "Contact"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 1000;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: BackgroundPainter(),
          ),
          ListView(
            children: [
              _appBar(size, isTablet),
              buildWrap(size),
              SizedBox(
                height: 5,
              ),
              buildRow()
            ],
          ),
          isTablet
              ? Positioned(
                  left: 120,
                  bottom: 60,
                  child: Cursor(
                    child: Container(
                      width: 45,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF3753AA).withOpacity(.2),
                              offset: Offset(10, 10),
                              blurRadius: 10)
                        ],
                      ),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        )
      ],
    );
  }

  Container buildWrap(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            offset: new Offset(5, 2.5),
          )
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          Container(
            height: breakpoint(size.width, size.height * .7, 200, 180),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: breakpoint(
                  size.width,
                  CrossAxisAlignment.start,
                  CrossAxisAlignment.center,
                  CrossAxisAlignment.center),
              mainAxisAlignment: breakpoint(
                  size.width,
                  MainAxisAlignment.center,
                  MainAxisAlignment.center,
                  MainAxisAlignment.end),
              children: [
                Text(
                  "Felipe Balbino",
                  style: GoogleFonts.asap(
                    fontSize: breakpoint(size.width, 75, 55, 50),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 12,
                  ),
                ),
                Text(
                  "Senior Java Developer | Flutter Developer",
                  style: GoogleFonts.asap(
                    fontSize: breakpoint(size.width, 22, 20, 14),
                    color: Colors.black26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeroBtn(
                      title: "Know more",
                      url: "https://www.linkedin.com/in/fjbalbino/",
                    ),
                    SizedBox(width: 20),
                    HeroBtn(
                        title: "Hire me",
                        isOutline: true,
                        url: "mailto:fjbalbino@gmail.com"),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/Image.png",
            fit: BoxFit.cover,
            width: 700,
            height: 650,
          ),
        ],
      ),
    );
  }

  _appBar(Size size, bool isTablet) => Container(
        height: 85,
        padding: EdgeInsets.only(right: 80),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            margin: EdgeInsets.only(
                left: breakpoint(size.width, 90, 80, 20), top: 20),
            child: Image.asset(
              "Logo.png",
            ),
          ),
          isTablet
              ? Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Row(
                    children: navItems
                        .map<Widget>((t) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Cursor(
                              child: Text(t.toUpperCase(),
                                  style: GoogleFonts.asap(
                                    fontWeight: FontWeight.w400,
                                  )),
                            )))
                        .toList(),
                  ))
              : IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                )
        ]),
      );
}
