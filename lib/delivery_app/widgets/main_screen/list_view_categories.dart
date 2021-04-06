import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/responsive.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';
import '../../data/categories.dart';
import '../../data/category_state.dart';

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({
    Key? key,
    required AnimationController animationHandler,
  })   : _animationHandler = animationHandler,
        super(key: key);

  final AnimationController _animationHandler;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      height: responsive.heightPercent(25),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (_, index) => _CardCategory(
          animationController: _animationHandler,
          category: categories[index],
          index: index,
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 25),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: responsive.heightPercent(2.5),
          bottom: responsive.heightPercent(4.5),
        ),
      ),
    );
  }
}

class _CardCategory extends StatelessWidget {
  const _CardCategory({
    required this.animationController,
    required this.index,
    required this.category,
    Key? key,
  }) : super(key: key);

  final AnimationController animationController;
  final Category category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final categoryState = Provider.of<CategoryState>(context);
    final categorySelected = categoryState.categorySelected;
    final isCategorySelected = categorySelected == index;

    Animation<double> _animationCardCategories;
    Animation<double> _animationContentCard;

    _animationCardCategories = CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.30 + (0.05 * index),
        0.75,
        curve: Curves.elasticOut,
      ),
    );
    _animationContentCard = CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.40 + (0.05 * index),
        0.75,
        curve: Curves.elasticOut,
      ),
    );

    return Transform.scale(
      scale: _animationCardCategories.value,
      child: InkWell(
        onTap: () => categoryState.categorySelected = index,
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.white.withOpacity(0.3),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: responsive.widthPercent(25),
          decoration: BoxDecoration(
            color: (isCategorySelected) ? kYellow : kWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              const BoxShadow(
                color: kMiddleBlack,
                blurRadius: 5.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Transform.scale(
                scale: _animationContentCard.value,
                child: SvgPicture.asset(
                  '${category.categoryImage}',
                  semanticsLabel: '${category.semanticLabel}',
                  alignment: Alignment.center,
                  height: responsive.heightPercent(5.5),
                  width: responsive.heightPercent(5.5),
                ),
              ),
              Container(
                width: responsive.widthPercent(25),
                height: responsive.heightPercent(3),
                child: Transform.scale(
                  scale: _animationContentCard.value,
                  child: AutoSizeText(
                    '${category.categoryName}',
                    style: kCategory,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
              Transform.scale(
                scale: _animationContentCard.value,
                child: _DotCategories(
                  background: (isCategorySelected) ? kWhite : kRed,
                  iconColor: (isCategorySelected) ? Colors.black : kWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DotCategories extends StatelessWidget {
  const _DotCategories({
    required this.background,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  final Color background;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: responsive.heightPercent(3.5),
      height: responsive.heightPercent(3.5),
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.angleRight,
          size: 10,
          color: iconColor,
        ),
      ),
    );
  }
}
