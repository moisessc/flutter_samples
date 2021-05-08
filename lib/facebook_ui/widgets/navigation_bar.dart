import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';
import '../data/local_providers.dart';
import '../theme/theme_state.dart';
import '../widgets/circle_button.dart';
import './notification_icon.dart';

const _duration = Duration(milliseconds: 400);
const double _bottomBarHide = -100.0;
const double _bottomBarShow = 0.0;

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    this.showBar = true,
    required this.selectedIndex,
  }) : super(key: key);

  final bool showBar;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final screensState = Provider.of<ScreensState>(context);
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);

    return AnimatedPositioned(
      duration: _duration,
      bottom: showBar ? _bottomBarShow : _bottomBarHide,
      left: 0,
      right: 0,
      child: Container(
        height: responsive.heightPercent(8),
        decoration: BoxDecoration(
          color: (themeState.isDarkTheme)
              ? (selectedIndex == 1)
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleButton(
              callback: () => screensState.page = 0,
              icon: SvgPicture.asset(
                'assets/facebook_ui/icons/home_icon.svg',
                color: (selectedIndex == 0)
                    ? const Color(0xff3284f5)
                    : Theme.of(context).iconTheme.color,
                height: responsive.heightPercent(2.5),
              ),
              backgroundColor: Colors.transparent,
            ),
            Stack(
              children: [
                CircleButton(
                  callback: () => screensState.page = 2,
                  icon: SvgPicture.asset(
                    'assets/facebook_ui/icons/watch_icon.svg',
                    color: (selectedIndex == 2)
                        ? const Color(0xff3284f5)
                        : Theme.of(context).iconTheme.color,
                    height: responsive.heightPercent(2.5),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                const Positioned(
                  right: 2,
                  top: 6,
                  child: NotificationIcon(),
                ),
              ],
            ),
            Stack(
              children: [
                CircleButton(
                  callback: () => screensState.page = 3,
                  icon: SvgPicture.asset(
                    'assets/facebook_ui/icons/shopping_icon.svg',
                    color: (selectedIndex == 3)
                        ? const Color(0xff3284f5)
                        : Theme.of(context).iconTheme.color,
                    height: responsive.heightPercent(2.5),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                const Positioned(
                  right: 2,
                  top: 7,
                  child: NotificationIcon(),
                ),
              ],
            ),
            CircleButton(
              callback: () => screensState.page = 4,
              icon: SvgPicture.asset(
                'assets/facebook_ui/icons/friends_icon.svg',
                color: (selectedIndex == 4)
                    ? const Color(0xff3284f5)
                    : Theme.of(context).iconTheme.color,
                height: responsive.heightPercent(2.5),
              ),
              backgroundColor: Colors.transparent,
            ),
            CircleButton(
              callback: () => screensState.page = 1,
              icon: SvgPicture.asset(
                'assets/facebook_ui/icons/menu_icon.svg',
                color: (selectedIndex == 1)
                    ? const Color(0xff3284f5)
                    : Theme.of(context).iconTheme.color,
                height: responsive.heightPercent(2.5),
              ),
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
