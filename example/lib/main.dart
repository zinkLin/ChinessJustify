import 'package:flutter/material.dart';
import 'package:chinessjustify/ChinessJustify.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = '中文justify。aksjhdg askjhd奥斯卡结婚的个啊升级的和啊数据回调啊数据回调爱上的痕迹,阿就是多个，阿萨德，按时，打分，12312，啊双打大所多';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text(text, textAlign: TextAlign.justify, style: TextStyle(
                fontSize: 20,
                color: Colors.red
            ),),
            ChinessJustify(
              text: text,
              lineHeight: 30,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue
              ),
            ),
          ],
        ),
      ),
    );
  }
}
