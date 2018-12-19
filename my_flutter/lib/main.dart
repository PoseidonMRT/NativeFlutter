import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:my_flutter/MyApp.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome
      .setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(_widgetForRoute(window.defaultRouteName)));
}

Widget _widgetForRoute(String route) {
  switch (route) {
    case "welcome":
      return new MyApp();
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}


