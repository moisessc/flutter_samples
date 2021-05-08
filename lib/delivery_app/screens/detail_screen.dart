import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/responsive.dart';
import '../core/colors.dart';
import '../core/text_styles.dart';
import '../data/product_details.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/detail_screen/details_header.dart';
import '../widgets/detail_screen/details_product.dart';
import '../widgets/detail_screen/list_view_ingredients.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductDetails product;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationAppBar;
  late Animation<double> _animationAIngredientsAndHeader;
  late Animation<double> _animationContainer;
  late Animation<double> _animationSize;
  late Animation<double> _animationCrust;
  late Animation<double> _animationDelivery;

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animationAppBar = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.10,
        0.50,
        curve: Curves.ease,
      ),
    );
    _animationAIngredientsAndHeader = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.30,
        0.75,
        curve: Curves.ease,
      ),
    );
    _animationContainer = Tween(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.20,
          0.70,
          curve: Curves.decelerate,
        ),
      ),
    );
    _animationSize = Tween(begin: -150.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.45,
          0.80,
          curve: Curves.decelerate,
        ),
      ),
    );
    _animationCrust = Tween(begin: -150.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.65,
          0.90,
          curve: Curves.decelerate,
        ),
      ),
    );
    _animationDelivery = Tween(begin: -150.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.75,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
    _animationController.forward();
  }

  @override
  void initState() {
    _setupAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final productName = widget.product.productName;
    final productPrice = widget.product.price;
    final productNameLength = widget.product.productName.length;
    final productImage = widget.product.image;

    final productSize = widget.product.size;
    final productCrust = widget.product.crust;
    final productDeliveryTime = widget.product.deliveryTime;

    final ingredientsList = widget.product.ingredients;

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Hero(
                  tag: productName,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, snapshot) {
                      return SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Material(
                          color: kWhite,
                          child: _DetailContent(
                            animationAppBar: _animationAppBar,
                            animationAIngredientsAndHeader:
                                _animationAIngredientsAndHeader,
                            productName: productName,
                            productNameLength: productNameLength,
                            productPrice: productPrice,
                            animationSize: _animationSize,
                            animationDelivery: _animationDelivery,
                            animationCrust: _animationCrust,
                            productSize: productSize,
                            productCrust: productCrust,
                            productDeliveryTime: productDeliveryTime,
                            ingredientsList: ingredientsList,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: responsive.widthPercent(5),
                left: responsive.widthPercent(5),
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, snapshot) {
                      return Transform.translate(
                        offset: Offset(0.0, _animationContainer.value),
                        child: Container(
                          height: responsive.heightPercent(11),
                          decoration: BoxDecoration(
                            color: kYellow,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(responsive.heightPercent(4)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Place an Order',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: responsive.heightPercent(2),
                                ),
                              ),
                              const SizedBox(width: 10),
                              FaIcon(
                                FontAwesomeIcons.angleRight,
                                size: responsive.heightPercent(2),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Positioned(
                top: responsive.heightPercent(20),
                bottom: responsive.heightPercent(30),
                right: -responsive.widthPercent(40),
                child: Hero(
                  tag: productImage,
                  child: Image.asset(productImage),
                ),
              )
            ],
          )),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    Key? key,
    required Animation<double> animationAppBar,
    required Animation<double> animationAIngredientsAndHeader,
    required Animation<double> animationSize,
    required Animation<double> animationDelivery,
    required Animation<double> animationCrust,
    required this.productName,
    required this.productNameLength,
    required this.productPrice,
    required this.productSize,
    required this.productCrust,
    required this.productDeliveryTime,
    required this.ingredientsList,
  })   : _animationAppBar = animationAppBar,
        _animationAIngredientsAndHeader = animationAIngredientsAndHeader,
        _animationSize = animationSize,
        _animationDelivery = animationDelivery,
        _animationCrust = animationCrust,
        super(key: key);

  final Animation<double> _animationAppBar;
  final Animation<double> _animationAIngredientsAndHeader;
  final String productName;
  final int productNameLength;
  final double productPrice;
  final Animation<double> _animationSize;
  final Animation<double> _animationDelivery;
  final Animation<double> _animationCrust;
  final String productSize;
  final String productCrust;
  final String productDeliveryTime;
  final List<String> ingredientsList;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Column(
      children: [
        Container(
          height: responsive.heightPercent(90),
          child: Column(
            children: [
              CustomAppBar(
                itemLeft: Transform.scale(
                  scale: _animationAppBar.value,
                  child: IconButtonTabBar(
                    backgroundColor: Colors.transparent,
                    border: true,
                    icon: const FaIcon(
                      FontAwesomeIcons.angleLeft,
                      size: 15.0,
                    ),
                    callback: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                itemRight: Transform.scale(
                  scale: _animationAppBar.value,
                  child: IconButtonTabBar(
                    backgroundColor: kYellow,
                    icon: const FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 15.0,
                      color: kWhite,
                    ),
                    callback: () => debugPrint('star'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsHeader(
                      animationAIngredientsAndHeader:
                          _animationAIngredientsAndHeader,
                      productName: productName,
                      productNameLength: productNameLength,
                      productPrice: productPrice,
                    ),
                    const SizedBox(height: 5),
                    DetailsProduct(
                      animationSize: _animationSize,
                      animationDelivery: _animationDelivery,
                      animationCrust: _animationCrust,
                      productSize: productSize,
                      productCrust: productCrust,
                      productDeliveryTime: productDeliveryTime,
                    ),
                    SizedBox(height: responsive.heightPercent(6)),
                    Transform.scale(
                      scale: _animationAIngredientsAndHeader.value,
                      child: const Text(
                        'Ingredients',
                        style: kSection,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  height: responsive.heightPercent(15),
                  child: IngredientsBuilder(
                    animationAIngredientsAndHeader:
                        _animationAIngredientsAndHeader,
                    ingredients: ingredientsList,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
