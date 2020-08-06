import 'package:flutter/material.dart';
import 'JustifyPainterModel.dart';

class JustifyPainter extends CustomPainter {
  String text;
  double width;
  TextStyle textStyle;
  double lineHeight;
  var complete;

  JustifyPainter(
      {@required this.text,
        @required this.textStyle,
        @required this.width,
        @required this.complete,
        @required this.lineHeight,
      });

  List<JustifyPainterCollection> prepareData() {
    var paint = new Paint();
    paint.color = textStyle.color;
    double offsetX = 0;
    double offsetY = 0;
    bool newLine = false;
    int textNum = 0;
    double gap;

    List<JustifyPainterCollection> listCollection = List();
    JustifyPainterCollection collection = JustifyPainterCollection(
        list: List()
    );
    listCollection.add(collection);

    text.runes.forEach((rune) {
      String str = new String.fromCharCode(rune);
      TextSpan span = new TextSpan(style: textStyle, text: str);
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      tp.layout();
      textNum++;

      if (offsetX+tp.width > width) {
        newLine = true;

        double differenceValue = width-offsetX;
        gap = differenceValue/(textNum-1);
        textNum = 0;

        offsetX = 0;
        offsetY += lineHeight;
      }

      double realY = (lineHeight-tp.height)/2;
      JustifyPainterModel model = JustifyPainterModel(
          tp: tp,
          x: offsetX,
          y: offsetY+realY
      );

      if (newLine) {
        newLine = false;

        collection.gap = gap;
        collection = JustifyPainterCollection(
            list: List()
        );
        collection.list.add(model);
        listCollection.add(collection);
      } else {
        collection.list.add(model);
      }

      offsetX = offsetX + tp.width;
    });

    Future.delayed(Duration(milliseconds: 100), (){
      complete(offsetY+lineHeight);
    });

    return listCollection;
  }

  @override
  void paint(Canvas canvas, Size size) {
    List<JustifyPainterCollection> collections = prepareData();

    collections.forEach((JustifyPainterCollection collection){
      int index = 0;
      collection.list.forEach((JustifyPainterModel model){
        model.tp.paint(canvas, new Offset(model.x + collection.gap*index++, model.y));
      });
    });
  }



  @override
  bool shouldRepaint(JustifyPainter oldDelegate) {
    return oldDelegate.text != text ||
        oldDelegate.textStyle != textStyle ||
        oldDelegate.width != width;
  }
}