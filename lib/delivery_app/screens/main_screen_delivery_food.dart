import 'package:flutter/material.dart';
import 'package:flutter_samples/utils/responsive.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../core/colors.dart';
import '../data/category_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/main_screen/custom_circle.dart';
import '../widgets/main_screen/list_view_categories.dart';
import '../widgets/main_screen/list_view_popular_food.dart';
import '../widgets/main_screen/main_header.dart';
import '../widgets/main_screen/section_text.dart';

class MainScreenDeliveryFood extends StatefulWidget {
  const MainScreenDeliveryFood({Key? key}) : super(key: key);

  @override
  _MainScreenDeliveryFoodState createState() => _MainScreenDeliveryFoodState();
}

class _MainScreenDeliveryFoodState extends State<MainScreenDeliveryFood>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationAvatar;
  late Animation<double> _animationCircle;
  late Animation<double> _animationMenuAndText;
  late Animation<double> _animationPopularText;

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animationAvatar = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.20,
        0.50,
        curve: Curves.elasticOut,
      ),
    );
    _animationCircle = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.10,
        0.50,
        curve: Curves.elasticOut,
      ),
    );
    _animationMenuAndText = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.20,
        0.50,
        curve: Curves.elasticOut,
      ),
    );
    _animationPopularText = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.45,
        0.80,
        curve: Curves.elasticOut,
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
    const profileImage = 'assets/delivery_app/images/profile_image.jpg';
    const menuIcon = 'assets/delivery_app/icons/menu.svg';
    final responsive = Responsive.of(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryState()),
      ],
      child: Scaffold(
        backgroundColor: kWhite,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) {
              return Stack(
                children: [
                  Transform.scale(
                    alignment: Alignment.center,
                    scale: _animationCircle.value,
                    origin: Offset(
                      -responsive.width * 0.3,
                      -responsive.height * 0.3,
                    ),
                    child: const CustomCircle(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        itemLeft: Transform.scale(
                          scale: _animationAvatar.value,
                          child: IconButtonTabBar(
                            icon: const CircleAvatar(
                              backgroundColor: kWhite,
                              backgroundImage: AssetImage(profileImage),
                              radius: 25,
                            ),
                            backgroundColor: Colors.transparent,
                            callback: () => debugPrint('Avatar'),
                          ),
                        ),
                        itemRight: Transform.scale(
                          scale: _animationMenuAndText.value,
                          child: IconButtonTabBar(
                            icon: SvgPicture.asset(
                              menuIcon,
                              alignment: Alignment.center,
                              height: responsive.heightPercent(3.5),
                              width: responsive.heightPercent(3.5),
                            ),
                            backgroundColor: Colors.transparent,
                            callback: () => debugPrint('menu'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => _animationController.forward(from: 0.0),
                        child: MainHeader(
                          animationMenuAndText: _animationMenuAndText,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Transform.scale(
                        scale: _animationMenuAndText.value,
                        child: const SectionText(text: 'Categories'),
                      ),
                      ListViewCategories(
                          animationHandler: _animationController),
                      const SizedBox(height: 10.0),
                      Transform.scale(
                        scale: _animationPopularText.value,
                        child: const SectionText(text: 'Popular'),
                      ),
                      ListViewPopularFood(
                        animationController: _animationController,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
