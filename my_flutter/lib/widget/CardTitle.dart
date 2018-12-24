import 'package:flutter/material.dart';

const TextStyle _titleStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Color.fromRGBO(14, 24, 35, 1.0),
);

const TextStyle _subTitleStyle = TextStyle(
  fontSize: 8.0,
  fontWeight: FontWeight.w500,
  color: Color.fromRGBO(78, 102, 114, 1.0),
);

class CardTitle extends StatelessWidget {
  final String title;

  final String subTitle;

  const CardTitle(this.title, {Key key, this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: _titleStyle,
        children: <TextSpan>[
          TextSpan(
            text: subTitle ?? "",
            style: _subTitleStyle,
          )
        ]
      ),
    );
  }
}
