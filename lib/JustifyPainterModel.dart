import 'package:flutter/material.dart';

class JustifyPainterCollection {
  List<JustifyPainterModel> list;
  double gap;

  JustifyPainterCollection({
    this.list,
    this.gap = 0
  });
}

class JustifyPainterModel {
  TextPainter tp;
  double x;
  double y;

  JustifyPainterModel({
    this.tp,
    this.x,
    this.y,
  });
}

