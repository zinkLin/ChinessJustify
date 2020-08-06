import 'package:flutter/material.dart';
import 'JustifyPainter.dart';

class ChinessJustify extends StatefulWidget {
  String text;
  TextStyle style;
  double lineHeight;
  ChinessJustify({this.text = "", this.style, this.lineHeight = 20});

  @override
  _ChinessJustifyState createState() => _ChinessJustifyState();
}

class _ChinessJustifyState extends State<ChinessJustify> {
  double contentWidth = 0;
  double contentHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 100), (){
      setState(() {
        contentWidth = context.size.width;
      });
    });
  }

  getBody() {
    if (contentWidth == 0) {
      return Container();
    } else {
      return Container(
        height: contentHeight,
        width: contentWidth,
        child: CustomPaint(
          painter: JustifyPainter(
              text: widget.text,
              textStyle: widget.style,
              lineHeight: widget.lineHeight,
              width: contentWidth,
              complete: (height) {
                setState(() {
                  contentHeight = height;
                });
              }
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}

