

import 'package:flutter/material.dart';

final double appBarHeight = 56.0;
const double baseHeight = 650.0;

double getAppBarHeight(BuildContext context) {
  return  screenAwareSize(appBarHeight, context);
}

double screenAwareSize(double size, BuildContext context) {
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * height / baseHeight;
}