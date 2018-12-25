import 'package:flutter/material.dart';
import 'package:my_flutter/inputpage/InputPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,//是否显示右上角的debug tag
      home: InputPage(),
    );
  }
}