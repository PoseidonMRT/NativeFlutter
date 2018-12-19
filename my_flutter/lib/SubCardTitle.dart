import 'package:flutter/material.dart';

class SubCardTitle extends StatelessWidget {

  final String subTitle;

  const SubCardTitle(this.subTitle,{Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: new TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500
      ),
    );
  }
}