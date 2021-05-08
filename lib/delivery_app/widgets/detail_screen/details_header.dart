import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/utils/responsive.dart';

import '../../core/text_styles.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required Animation<double> animationAIngredientsAndHeader,
    required this.productName,
    required this.productNameLength,
    required this.productPrice,
    this.margin = 20,
  })  : _animationAIngredientsAndHeader = animationAIngredientsAndHeader,
        super(key: key);

  final Animation<double> _animationAIngredientsAndHeader;
  final String productName;
  final int productNameLength;
  final double productPrice;
  final double margin;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          alignment: Alignment.centerLeft,
          scale: _animationAIngredientsAndHeader.value,
          child: Container(
            width: responsive.widthPercent(60),
            height: responsive.heightPercent(12.5),
            child: AutoSizeText(
              '$productName',
              style: kHeader,
              maxLines: 2,
            ),
          ),
        ),
        const SizedBox(height: 10),
        PriceText(
          animationAIngredientsAndHeader: _animationAIngredientsAndHeader,
          productPrice: productPrice,
        ),
      ],
    );
  }
}

class PriceText extends StatelessWidget {
  const PriceText({
    Key? key,
    required Animation<double> animationAIngredientsAndHeader,
    required this.productPrice,
  })   : _animationAIngredientsAndHeader = animationAIngredientsAndHeader,
        super(key: key);

  final Animation<double> _animationAIngredientsAndHeader;
  final double productPrice;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      height: responsive.heightPercent(7.5),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Transform.scale(
                scale: _animationAIngredientsAndHeader.value,
                child: const Text(
                  '\$',
                  style: kPriceSymbol,
                ),
              ),
            ),
            Transform.scale(
              scale: _animationAIngredientsAndHeader.value,
              alignment: Alignment.centerLeft,
              child: Text(
                '$productPrice',
                style: kPrice,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
