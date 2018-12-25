import 'package:flutter/material.dart';
import 'package:my_flutter/utils/widget_utils.dart' show appBarHeight;
import 'package:my_flutter/utils/widget_utils.dart' show screenAwareSize;

class BmiAppBar extends StatelessWidget {
  static const String wavingHandEmoji = "\uD83D\uDC4B";
  static const String whiteSkinTone = "\uD83C\uDFFB";

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        height: appBarHeight(context),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(screenAwareSize(16.0, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildIcon(context),
              _buildLabel(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(11.0, context)),
      child: Container(
        height: screenAwareSize(20.0, context),
        width: screenAwareSize(20.0, context),
        child: Placeholder(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  RichText _buildIcon(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 34.0),
            children: [
          TextSpan(
            text: "Hi Tester",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: getEmoji(context),
          ),
        ]));
  }

  String getEmoji(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? wavingHandEmoji
        : wavingHandEmoji + whiteSkinTone;
  }
}
