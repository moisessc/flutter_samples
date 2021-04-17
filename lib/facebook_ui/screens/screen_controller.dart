import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/local_providers.dart';
import '../theme/theme_state.dart';
import '../widgets/bottom_menu_bar.dart';
import './home_screen.dart';
import './settings_screen.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarState = Provider.of<BottomBarState>(context);
    final screensState = Provider.of<ScreensState>(context);
    final themeState = Provider.of<ThemeState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook UI',
      theme: themeState.currentTheme,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: screensState.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const HomeScreen(),
                const SettingsScreen(),
              ],
            ),
            BottomMenuBar(
              showBar: bottomBarState.showBottomBar,
              selectedIndex: screensState.page,
            ),
          ],
        ),
      ),
    );
  }
}
