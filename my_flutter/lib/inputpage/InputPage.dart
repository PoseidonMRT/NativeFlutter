import 'package:flutter/material.dart';
import 'package:my_flutter/utils/widget_utils.dart' show screenAwareSize;
import 'package:my_flutter/utils/widget_utils.dart' show appBarHeight;
import 'package:my_flutter/inputpage/gender/GenderCard.dart';
import 'package:my_flutter/inputpage/weight/WeightCard.dart';
import 'package:my_flutter/inputpage/height/HeightCard.dart';
import 'package:my_flutter/appbar/BmiAppBar.dart';
import 'package:my_flutter/inputpage/gender/Gender.dart';
import 'package:my_flutter/inputpage/inputsummary/InputSummaryCard.dart';
import 'package:my_flutter/bottombar/PacmanSlider.dart';

class InputPage extends StatefulWidget {
  @override
  State createState() {
    return new InputPageState();
  }
}

class InputPageState extends State<InputPage> {
  Gender gender = Gender.other;
  int height = 170;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: BmiAppBar(),
          preferredSize: Size.fromHeight(appBarHeight(context))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputSummaryCard(
            gender: gender,
            weight: weight,
            height: height,
          ),
          Expanded(child: _buildCards(context)),
          _buildBottom(context),
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: Container(
        height: screenAwareSize(52.0, context),
        child: PacmanSlider(),
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: GenderCard(
                initialGender: gender,
                onChanged: (val) => setState(() => gender = val),
              )),
              Expanded(
                  child: WeightCard(
                initialWeight: weight,
                onChanged: (val) => setState(() => weight = val),
              )),
            ],
          ),
        ),
        Expanded(
          child: HeightCard(
            height: height,
            onChanged: (val) => setState(() => height = val),
          ),
        )
      ],
    );
  }
}
