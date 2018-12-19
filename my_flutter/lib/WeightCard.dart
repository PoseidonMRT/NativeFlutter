import 'package:flutter/material.dart';
import 'package:my_flutter/CardTitle.dart';
import 'SubCardTitle.dart';
import 'widget_utils.dart' show screenAwareSize;

double _ovalWidth(BuildContext context) {
  return screenAwareSize(100.0, context);
}

double _ovalHeight(BuildContext context) {
  return screenAwareSize(80.0, context);
}

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() {
    return _WeightCardState();
  }
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(4.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: screenAwareSize(4.0, context)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CardTitle("Weight"),
                    SubCardTitle("(kg)"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenAwareSize(4.0, context)),
                child: _drawMainStack(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawMainStack(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _drawCircleIndicator(context),
      ],
    );
  }

  Widget _drawCircleIndicator(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        WeightOval(),
      ],
    );
  }
}

class WeightOval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _ovalWidth(context),
      height: _ovalHeight(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(244, 244, 244, 1.0),
      ),
    );
  }
}
