import 'package:flutter/material.dart';
import 'package:my_flutter/utils/widget_utils.dart' show screenAwareSize;
import 'package:my_flutter/utils/widget_utils.dart' show appBarHeight;
import 'package:my_flutter/inputpage/gender/GenderCard.dart';
import 'package:my_flutter/inputpage/weight/WeightCard.dart';
import 'package:my_flutter/inputpage/height/HeightCard.dart';
import 'package:my_flutter/appbar/BmiAppBar.dart';

class InputPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: BmiAppBar(),
          preferredSize: Size.fromHeight(appBarHeight(context))),
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: _buildCards(context)),
            _buildBottom(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: screenAwareSize(108.0, context),
      width: double.infinity,
      child: Switch(value: true, onChanged: (val) {}),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.0,
        right: 14.0,
        top: screenAwareSize(32.0, context),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: GenderCard()),
                Expanded(child: WeightCard()),
              ],
            ),
          ),
          Expanded(
            child: HeightCard(),
          )
        ],
      ),
    );
  }
}
