import 'package:flutter/material.dart';
import 'widget_utils.dart' show screenAwareSize;

const TextStyle labelsTextStyle = const TextStyle(
  color: labelsGrey,
  fontSize: labelsFontSize,
);

const double labelsFontSize = 13.0;

const Color labelsGrey = const Color.fromRGBO(216, 217, 223, 1.0);

const double circleSize = 32.0;
const double marginBottom = circleSize / 2;
const double marginTop = 26.0;

double marginBottomAdapted(BuildContext context) =>
    screenAwareSize(marginBottom, context);

double marginTopAdapted(BuildContext context) =>
    screenAwareSize(marginTop, context);

class HeightPicker extends StatefulWidget {
  final int maxHeight;

  final int minHeight;

  final int height;

  final double widgetHeight;

  //数据变化的回调
  final ValueChanged<int> onChange;

  int get totalUnits => maxHeight - minHeight;

  const HeightPicker(
      {Key key,
      this.height,
      this.widgetHeight,
      this.onChange,
      this.maxHeight = 190,
      this.minHeight = 145})
      : super(key: key);

  @override
  _HeightPickerState createState() {
    return _HeightPickerState();
  }
}

class _HeightPickerState extends State<HeightPicker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _drawLabels(),
      ],
    );
  }

  /// 绘制右侧的身高列表，~/ - 除法操作符，返回除法的取整结果
  Widget _drawLabels() {
    int labelsToDisplay = widget.totalUnits ~/ 5 + 1;
    List<Widget> labels = List.generate(labelsToDisplay, (idx) {
      return Text(
        "${widget.maxHeight - 5 * idx}",
        style: labelsTextStyle,
      );
    });

    return Align(
      alignment: Alignment.centerRight,
      child: IgnorePointer(
        child: Padding(
          padding: EdgeInsets.only(
              top: marginTopAdapted(context),
              bottom: marginBottomAdapted(context),
              right: screenAwareSize(12.0, context)),
          child: Column(
            children: labels,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
