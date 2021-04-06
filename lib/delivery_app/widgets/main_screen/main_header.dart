import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/delivery_app/core/colors.dart';
import 'package:flutter_samples/utils/responsive.dart';

import '../../core/text_styles.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    Key? key,
    required Animation<double> animationMenuAndText,
  })   : _animationMenuAndText = animationMenuAndText,
        super(key: key);

  final Animation<double> _animationMenuAndText;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: responsive.heightPercent(3),
                child: Transform.scale(
                  scale: _animationMenuAndText.value,
                  child: const AutoSizeText(
                    'Food',
                    style: kSubHeader,
                    maxLines: 1,
                  ),
                ),
              ),
              Container(
                width: responsive.widthPercent(50),
                height: responsive.heightPercent(8),
                child: Transform.scale(
                  scale: _animationMenuAndText.value,
                  child: const AutoSizeText(
                    'Delivery',
                    style: kHeader,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
          Transform.scale(
            scale: _animationMenuAndText.value,
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: kLightBlack),
                icon: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
