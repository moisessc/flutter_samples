import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/responsive.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';
import '../../data/product_details.dart';
import '../../screens/detail_screen.dart';

class ListViewPopularFood extends StatelessWidget {
  const ListViewPopularFood({
    Key? key,
    required AnimationController animationController,
  })   : _animationController = animationController,
        super(key: key);

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: detailsProducts.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        itemBuilder: (_, index) => _CardPopularFood(
          animationController: _animationController,
          product: detailsProducts[index],
          index: index,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 25.0),
      ),
    );
  }
}

class _CardPopularFood extends StatelessWidget {
  const _CardPopularFood({
    required this.animationController,
    required this.product,
    required this.index,
    Key? key,
  }) : super(key: key);

  final AnimationController animationController;
  final ProductDetails product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final _animationSlide = Tween(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.59 + (0.05 * index),
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
    final _animationRotate = Tween(begin: math.pi, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.59 + (0.1 * index),
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 750),
          reverseTransitionDuration: const Duration(milliseconds: 750),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          pageBuilder: (_, __, ___) => DetailScreen(
            product: product,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: responsive.heightPercent(22),
            padding: const EdgeInsets.only(
              right: 20.0,
              bottom: 5.0,
              top: 5.0,
            ),
            child: _CardPopularProduct(
              product: product,
              index: index,
              animationController: animationController,
            ),
          ),
          Positioned(
            right: 0,
            top: responsive.heightPercent(1.5),
            bottom: responsive.heightPercent(2.5),
            child: Hero(
              tag: product.image,
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                final toHero = toHeroContext.widget;
                return RotationTransition(
                  turns: animation,
                  child: toHero,
                );
              },
              child: Transform.translate(
                offset: Offset(_animationSlide.value, 0.0),
                child: Transform.rotate(
                  angle: _animationRotate.value,
                  child: Image.asset('${product.image}'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardPopularProduct extends StatelessWidget {
  const _CardPopularProduct({
    Key? key,
    required this.product,
    required this.index,
    required AnimationController animationController,
  })   : _animationController = animationController,
        super(key: key);

  final int index;
  final ProductDetails product;
  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    final _animationCardPopularFood = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.50 + (0.05 * index),
        1.0,
        curve: Curves.elasticOut,
      ),
    );
    final _animationCrown = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.57 + (0.05 * index),
        .85,
        curve: Curves.elasticOut,
      ),
    );

    return Transform.scale(
      scale: _animationCardPopularFood.value,
      child: Hero(
        tag: product.productName,
        child: Material(
          color: kWhite,
          child: Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                const BoxShadow(
                  color: kMiddleBlack,
                  blurRadius: 10.0,
                  offset: Offset(10, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ProductInformation(
                  product: product,
                  index: index,
                  animationCrown: _animationCrown,
                ),
                _BottomCard(
                  product: product,
                  animationCrown: _animationCrown,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductInformation extends StatelessWidget {
  const _ProductInformation({
    Key? key,
    required this.product,
    required this.index,
    required Animation<double> animationCrown,
  })   : _animationCrown = animationCrown,
        super(key: key);

  final ProductDetails product;
  final int index;
  final Animation<double> _animationCrown;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: responsive.heightPercent(1.5),
        left: responsive.heightPercent(1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: _animationCrown.value,
                child: const FaIcon(
                  FontAwesomeIcons.crown,
                  size: 10,
                  color: kYellowCrown,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '${product.top}',
                style: kTopPopularCard,
              ),
            ],
          ),
          SizedBox(height: responsive.heightPercent(3)),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: responsive.heightPercent(3),
                child: AutoSizeText(
                  '${product.productName}',
                  style: kHeaderPopularCard,
                  maxLines: 1,
                ),
              ),
              SizedBox(height: responsive.heightPercent(.5)),
              Container(
                height: responsive.heightPercent(2.5),
                child: AutoSizeText(
                  '${product.weight}',
                  style: kSubHeaderPopularCard,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomCard extends StatelessWidget {
  const _BottomCard({
    Key? key,
    required Animation<double> animationCrown,
    required this.product,
  })   : _animationCrown = animationCrown,
        super(key: key);

  final Animation<double> _animationCrown;
  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Row(
      children: [
        Container(
          height: responsive.heightPercent(6),
          width: responsive.widthPercent(25),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: kYellow,
          ),
          child: Center(
            child: Transform.scale(
              scale: _animationCrown.value,
              child: const FaIcon(
                FontAwesomeIcons.plus,
                size: 12,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.solidStar,
              size: 10,
            ),
            const SizedBox(width: 5),
            Container(
              height: responsive.heightPercent(3),
              child: Center(
                child: AutoSizeText(
                  '${product.stars}',
                  style: kPuntuationPopularCard,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
