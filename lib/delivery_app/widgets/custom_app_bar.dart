import 'package:flutter/material.dart';
import 'package:flutter_samples/delivery_app/core/colors.dart';

import '../../utils/responsive.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.itemLeft,
    required this.itemRight,
    this.margin = const EdgeInsets.symmetric(horizontal: 20),
    Key? key,
  }) : super(key: key);

  final Widget itemLeft;
  final Widget itemRight;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [itemLeft, itemRight],
      ),
    );
  }
}

class IconButtonTabBar extends StatelessWidget {
  const IconButtonTabBar({
    required this.icon,
    required this.backgroundColor,
    required this.callback,
    this.border = false,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final Color backgroundColor;
  final bool border;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: callback,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: responsive.heightPercent(6),
          width: responsive.heightPercent(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: (border)
                ? Border.all(
                    width: 1.0,
                    color: kLightBlack,
                    style: BorderStyle.solid,
                  )
                : null,
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
