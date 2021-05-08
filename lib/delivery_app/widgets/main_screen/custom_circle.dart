import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import '../../core/colors.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      height: responsive.height,
      width: responsive.width,
      child: CustomPaint(
        painter: CircleWidget(),
      ),
    );
  }
}

class CircleWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kLightGray
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;
    final offsetDraw = Offset(size.width * 0.2, size.height * 0.1);
    canvas.drawCircle(offsetDraw, size.width * 0.6, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
