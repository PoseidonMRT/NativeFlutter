import 'package:flutter/material.dart';
import 'package:my_flutter/CardTitle.dart';
import 'package:flutter_svg/svg.dart';
import 'widget_utils.dart' show screenAwareSize;

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
          padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardTitle(
                "Weight",
                subTitle: " (kg)",
              ),
              Padding(
                padding: EdgeInsets.only(top: screenAwareSize(4.0, context)),
                child: _drawWeightSlider(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawWeightSlider(BuildContext context) {
    return WeightBackground();
  }
}

class WeightBackground extends StatelessWidget {

  final Widget child;

  const WeightBackground({Key key,this.child}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(100.0, context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1.0),
            borderRadius: new BorderRadius.circular(screenAwareSize(50.0, context)),
          ),
          child: child,
        ),
        SvgPicture.asset(
          "images/weight_arrow.svg",
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(18.0, context),
        )
      ],
    );
  }
}
