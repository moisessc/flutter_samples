import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class CircleButton extends StatelessWidget {
  CircleButton({
    Key? key,
    required this.callback,
    required this.icon,
    required this.backgroundColor,
    this.height = 0.0,
    this.width = 0.0,
  }) : super(key: key);

  final VoidCallback callback;
  final Widget icon;
  final Color backgroundColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final heightResponfive =
        (height == 0.0) ? responsive.heightPercent(4.5) : height;
    final widthResponfive =
        (width == 0.0) ? responsive.heightPercent(4.5) : width;
    return ClipOval(
      child: Container(
        height: heightResponfive,
        width: widthResponfive,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: callback,
            child: Center(child: icon),
          ),
        ),
      ),
    );
  }
}
