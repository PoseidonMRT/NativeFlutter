import 'package:flutter/material.dart';
import 'package:my_flutter/CardTitle.dart';
import 'HeightPicker.dart';
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
            CardTitle("Height",subTitle: "(cm)",),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(bottom: screenAwareSize(8.0, context)),
                  child: LayoutBuilder(
                      builder: (context,constraints){
                        return HeightPicker(
                          widgetHeight: constraints.maxHeight,
                          height: height,
                          onChange: (val) => setState(() => height = val),
                        );
                      }
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}