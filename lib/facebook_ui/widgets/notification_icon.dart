import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      height: responsive.heightPercent(1.3),
      width: responsive.heightPercent(1.3),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: responsive.heightPercent(1),
          width: responsive.heightPercent(1),
          decoration: const BoxDecoration(
            color: Color(0xffee305e),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
