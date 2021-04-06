import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/utils/responsive.dart';

import '../../core/text_styles.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({
    Key? key,
    required Animation<double> animationSize,
    required this.productSize,
    required Animation<double> animationCrust,
    required this.productCrust,
    required Animation<double> animationDelivery,
    required this.productDeliveryTime,
  })   : _animationSize = animationSize,
        _animationCrust = animationCrust,
        _animationDelivery = animationDelivery,
        super(key: key);

  final Animation<double> _animationSize;
  final Animation<double> _animationDelivery;
  final Animation<double> _animationCrust;
  final String productSize;
  final String productCrust;
  final String productDeliveryTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: Offset(
            _animationSize.value,
            0.0,
          ),
          child: DescriptionProductElement(
            tittle: 'Size',
            value: '$productSize',
          ),
        ),
        Transform.translate(
          offset: Offset(
            _animationCrust.value,
            0.0,
          ),
          child: DescriptionProductElement(
            tittle: 'Crust',
            value: '$productCrust',
          ),
        ),
        Transform.translate(
          offset: Offset(
            _animationDelivery.value,
            0.0,
          ),
          child: DescriptionProductElement(
            tittle: 'Delivery in',
            value: '$productDeliveryTime',
          ),
        ),
      ],
    );
  }
}

class DescriptionProductElement extends StatelessWidget {
  const DescriptionProductElement({
    required this.tittle,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String tittle;
  final String value;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      margin: EdgeInsets.only(top: responsive.heightPercent(2.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: responsive.heightPercent(3),
            child: AutoSizeText(
              '$tittle',
              style: kDetailsTitleDescription,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: responsive.heightPercent(3),
            child: AutoSizeText('$value', style: kDetailsDescription),
          ),
        ],
      ),
    );
  }
}
