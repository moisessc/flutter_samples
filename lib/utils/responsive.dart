import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class Responsive {
  const Responsive({
    required this.width,
    required this.height,
    required this.inch,
  });

  factory Responsive.of(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size;
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));

    return Responsive(height: size.height, width: size.width, inch: inch);
  }

  final double width, height, inch;

  double widthPercent(double percent) {
    return width * percent / 100;
  }

  double heightPercent(double percent) {
    return height * percent / 100;
  }

  double inchPercent(double percent) {
    return inch * percent / 100;
  }
}
