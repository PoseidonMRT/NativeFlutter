import 'package:flutter/material.dart';
import 'package:my_flutter/CardTitle.dart';
import 'widget_utils.dart' show screenAwareSize;

class HeightCard extends StatefulWidget {

  final int height;

  const HeightCard({Key key,this.height}):super(key:key);

  @override
  _HeightCardState createState() {
    return _HeightCardState();
  }
}

class _HeightCardState extends State<HeightCard> {

  int height;

  @override
  void initState() {
    super.initState();
    height = widget.height ?? 170;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardTitle("Height",subTitle: "(cm)",)

          ],
        ),
      ),
    );
  }
}