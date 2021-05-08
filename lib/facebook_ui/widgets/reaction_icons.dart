import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Reactions extends StatelessWidget {
  const Reactions({
    Key? key,
    required this.principalCircleHight,
    required this.principalCircleWidth,
    required this.secondaryCircleHight,
    required this.secondaryCircleWidth,
    required this.iconSize,
    required this.rightSeparation,
  }) : super(key: key);

  final double principalCircleHight;
  final double principalCircleWidth;
  final double secondaryCircleHight;
  final double secondaryCircleWidth;
  final double iconSize;
  final double rightSeparation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: rightSeparation,
          child: Container(
            height: principalCircleHight,
            width: principalCircleWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: secondaryCircleHight,
                width: secondaryCircleWidth,
                decoration: const BoxDecoration(
                  color: Color(0xff3284f5),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidThumbsUp,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: principalCircleHight,
            width: principalCircleWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: secondaryCircleHight,
                width: secondaryCircleWidth,
                decoration: const BoxDecoration(
                  color: Color(0xffee305e),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
