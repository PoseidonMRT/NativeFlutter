import 'package:flutter/material.dart';
import 'package:my_flutter/utils/widget_utils.dart' show screenAwareSize;
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class PacmanSlider extends StatefulWidget {
  @override
  _PacmanSliderState createState() {
    return _PacmanSliderState();
  }
}

class _PacmanSliderState extends State<PacmanSlider>
    with TickerProviderStateMixin {
  final int numOfDots = 10;
  final double minOpacity = 0.1;
  final double maxOpacity = 0.5;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    initAnimationController();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  initAnimationController() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 800), () {
          animationController.forward(from: 0.0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenAwareSize(52.0, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenAwareSize(24.0, context)),
        child: Row(
          children: <Widget>[
            PacmanIcon(),
            Expanded(child: _drawDots()),
          ],
        ),
      ),
    );
  }

  Widget _drawDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(numOfDots, _generateDot)
        ..add(Opacity(
          opacity: maxOpacity,
          child: Dot(
            size: 14.0,
          ),
        )),
    );
  }

  Widget _generateDot(int dotNumber) {
    Animation animation = _initDotAnimation(dotNumber);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) =>
          Opacity(opacity: animation.value, child: child),
      child: Dot(size: 9.0),
    );
  }

  Animation<double> _initDotAnimation(int dotNum) {
    double lastDotStartTime = 0.3;
    double dotAnimationDuration = 0.6;
    double begin = lastDotStartTime * dotNum / numOfDots;
    double end = begin + dotAnimationDuration;
    return SinusoidalAnimation(min: minOpacity, max: maxOpacity)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(begin, end),
    ));
  }
}

class Dot extends StatelessWidget {
  final double size;

  const Dot({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenAwareSize(size, context),
      width: screenAwareSize(size, context),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}

class PacmanIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenAwareSize(16.0, context)),
      child: SvgPicture.asset(
        "images/pacman.svg",
        height: screenAwareSize(25.0, context),
        width: screenAwareSize(21.0, context),
      ),
    );
  }
}

class SinusoidalAnimation extends Animatable<double> {
  SinusoidalAnimation({this.min, this.max});

  final double min;
  final double max;

  @protected
  double lerp(double t) {
    return min + (max - min) * math.sin(math.pi * t);
  }

  @override
  double transform(double t) {
    return (t == 0.0 || t == 1.0) ? min : lerp(t);
  }
}
