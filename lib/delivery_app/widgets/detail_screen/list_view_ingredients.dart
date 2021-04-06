import 'package:flutter/material.dart';
import 'package:flutter_samples/utils/responsive.dart';

import '../../core/colors.dart';

class IngredientsBuilder extends StatelessWidget {
  const IngredientsBuilder({
    required this.ingredients,
    required Animation<double> animationAIngredientsAndHeader,
    Key? key,
  })  : _animationAIngredientsAndHeader = animationAIngredientsAndHeader,
        super(key: key);

  final List<String> ingredients;
  final Animation<double> _animationAIngredientsAndHeader;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return ListView.separated(
      itemCount: ingredients.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: responsive.widthPercent(5),
        vertical: responsive.heightPercent(2),
      ),
      itemBuilder: (_, index) {
        return Transform.scale(
          alignment: Alignment.topCenter,
          scale: _animationAIngredientsAndHeader.value,
          child: Container(
            width: responsive.widthPercent(25),
            padding: EdgeInsets.all(responsive.heightPercent(1)),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Transform.scale(
              scale: _animationAIngredientsAndHeader.value,
              alignment: Alignment.topCenter,
              child: Image.asset(ingredients[index]),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 30),
    );
  }
}
