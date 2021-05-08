import 'package:flutter/material.dart';
import 'package:flutter_samples/facebook_ui/widgets/circle_button.dart';
import 'package:flutter_samples/facebook_ui/widgets/header_app.dart';
import 'package:flutter_samples/facebook_ui/widgets/large_button.dart';
import 'package:flutter_samples/facebook_ui/widgets/notification_icon.dart';
import 'package:flutter_samples/utils/responsive.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../theme/theme_state.dart';
import '../widgets/reaction_icons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          const HeaderApp(),
          SizedBox(height: responsive.heightPercent(1.5)),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final height = constraints.maxHeight;
                return Container(
                  decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: responsive.widthPercent(5.5),
                              left: responsive.widthPercent(5.5),
                              top: (height > 500)
                                  ? responsive.widthPercent(4)
                                  : responsive.widthPercent(2),
                            ),
                            child: const _HeaderSettings(),
                          ),
                          SizedBox(
                            height: (height > 500)
                                ? responsive.heightPercent(2)
                                : responsive.heightPercent(.5),
                          ),
                          const SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: _SettingsSection(),
                          ),
                          SizedBox(
                            height: (height > 500)
                                ? responsive.heightPercent(2.5)
                                : responsive.heightPercent(1.5),
                          ),
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: _NewsInformationSection(height: height),
                          ),
                          SizedBox(
                            height: (height > 500)
                                ? responsive.heightPercent(3.5)
                                : responsive.heightPercent(3),
                          ),
                          const _OptionsSection()
                        ],
                      ),
                      Positioned(
                        right: 15,
                        left: 15,
                        bottom: responsive.heightPercent(7.5),
                        child: const Divider(thickness: 2),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderSettings extends StatelessWidget {
  const _HeaderSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final theme = themeState.currentTheme;
    final responsive = Responsive.of(context);
    final switchThemeStatus = themeState.isDarkTheme;
    const darkModeIcon = 'assets/facebook_ui/icons/dark_mode_icon.png';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Menú',
          style: TextStyle(
            fontSize: responsive.heightPercent(2.7),
            fontWeight: FontWeight.w700,
            color: theme.accentColor,
          ),
        ),
        Container(
          width: responsive.widthPercent(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: responsive.widthPercent(5),
                child: const Image(
                  image: AssetImage(darkModeIcon),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                'Modo oscuro',
                style: TextStyle(
                  color: theme.accentColor,
                ),
              ),
              Transform.scale(
                scale: .5,
                child: Switch.adaptive(
                  value: switchThemeStatus,
                  activeColor: const Color(0xff3183f6),
                  onChanged: (value) => themeState.isDarkTheme = value,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: responsive.widthPercent(5.5),
          ),
          child: LargeButton(
            callback: () => debugPrint('Help'),
            height: responsive.widthPercent(8.5),
            width: responsive.widthPercent(37),
            text: 'Ayuda y soporte',
            icon: FaIcon(
              FontAwesomeIcons.solidQuestionCircle,
              color: Colors.green,
              size: responsive.widthPercent(3),
            ),
            fontSize: responsive.widthPercent(1),
          ),
        ),
        SizedBox(width: responsive.widthPercent(2.5)),
        LargeButton(
          callback: () => debugPrint('Settings'),
          height: responsive.widthPercent(8.5),
          width: responsive.widthPercent(53),
          text: 'Configuración y privacidad',
          icon: FaIcon(
            FontAwesomeIcons.cog,
            color: Colors.blue,
            size: responsive.widthPercent(3),
          ),
          fontSize: responsive.widthPercent(1),
        ),
        SizedBox(width: responsive.widthPercent(2.5)),
        Padding(
          padding: EdgeInsets.only(
            right: responsive.widthPercent(5.5),
          ),
          child: LargeButton(
            callback: () => debugPrint('View more'),
            height: responsive.heightPercent(4),
            width: responsive.widthPercent(23),
            text: 'Ver más',
            icon: FaIcon(
              FontAwesomeIcons.infoCircle,
              color: Colors.green,
              size: responsive.heightPercent(1.5),
            ),
            fontSize: responsive.heightPercent(1),
          ),
        ),
      ],
    );
  }
}

class _NewsInformationSection extends StatelessWidget {
  const _NewsInformationSection({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    const imageAgo = 'assets/facebook_ui/images/settings_ago.png';
    const covidBackground = 'assets/facebook_ui/images/covid_background.svg';
    const backArrowIcon = 'assets/facebook_ui/icons/back-arrow.svg';
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.widthPercent(5.5),
      ),
      child: Row(
        children: [
          Container(
            height: (height > 500) ? height * 0.195 : height * 0.22,
            width: responsive.widthPercent(55),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(imageAgo),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => debugPrint(
                  'Preview post old',
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleButton(
                        callback: () => debugPrint('Ago'),
                        icon: SvgPicture.asset(backArrowIcon),
                        backgroundColor: Colors.white,
                        height: responsive.heightPercent(3),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: Container(
                        height: responsive.heightPercent(3),
                        width: responsive.widthPercent(20),
                        decoration: BoxDecoration(
                          color: const Color(0xfff1f6fd),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Hace 3 años',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff364987),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: responsive.widthPercent(2.5)),
          Container(
            height: (height > 500) ? height * 0.195 : height * 0.22,
            width: responsive.widthPercent(55),
            decoration: BoxDecoration(
              color: const Color(0xff3284f5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => debugPrint(
                  'Covid Information',
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      right: 0,
                      left: 20,
                      child: SvgPicture.asset(covidBackground),
                    ),
                    Positioned(
                      top: 15,
                      left: 15,
                      child: Container(
                        width: responsive.widthPercent(40),
                        child: Text(
                          'Centro de información COVID-19',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.widthPercent(3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _OptionsSection extends StatelessWidget {
  const _OptionsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    const watchColorIcon = 'assets/facebook_ui/icons/watch_color_icon.svg';
    const shopColorIcon = 'assets/facebook_ui/icons/shopping_color_icon.svg';
    const heartColorIcon = 'assets/facebook_ui/icons/heart_icon.svg';
    const gamesIcon = 'assets/facebook_ui/icons/games_icon.svg';
    const jobsIcon = 'assets/facebook_ui/icons/jobs_icon.svg';
    const savedIcon = 'assets/facebook_ui/icons/saved_icon.svg';

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.widthPercent(5.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SettingsButton(
                  icon: SvgPicture.asset(watchColorIcon),
                  text: 'Videos en Watch',
                  topWidget: const NotificationIcon(),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: SettingsButton(
                  icon: SvgPicture.asset(shopColorIcon),
                  text: 'Marketplace',
                  topWidget: const NotificationIcon(),
                ),
              ),
            ],
          ),
          SizedBox(height: responsive.widthPercent(3.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SettingsButton(
                  icon: SvgPicture.asset(heartColorIcon),
                  text: 'Parejas',
                  topWidget: DatingIcons(
                    iconSize: responsive.widthPercent(2),
                    rightSeparation: 25,
                    principalCircleHight: responsive.heightPercent(2),
                    principalCircleWidth: responsive.heightPercent(2),
                    secondaryCircleHight: responsive.heightPercent(1.5),
                    secondaryCircleWidth: responsive.heightPercent(1.5),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: SettingsButton(
                  icon: SvgPicture.asset(gamesIcon),
                  text: 'Videojuegos',
                  topWidget: Reactions(
                    iconSize: responsive.widthPercent(1.8),
                    rightSeparation: responsive.widthPercent(3),
                    principalCircleHight: responsive.widthPercent(4),
                    principalCircleWidth: responsive.widthPercent(4),
                    secondaryCircleHight: responsive.widthPercent(3),
                    secondaryCircleWidth: responsive.widthPercent(3),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: responsive.widthPercent(3.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SettingsButton(
                  icon: SvgPicture.asset(jobsIcon),
                  text: 'Empleos',
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: SettingsButton(
                  icon: SvgPicture.asset(savedIcon),
                  text: 'Guardados',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  SettingsButton({
    Key? key,
    required this.icon,
    required this.text,
    this.topWidget,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final Widget? topWidget;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      child: Stack(
        children: [
          Container(
            height: responsive.heightPercent(8),
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(responsive.heightPercent(2)),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => debugPrint('$text'),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icon,
                      const SizedBox(width: 12),
                      Text(
                        text,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: responsive.widthPercent(2.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 10,
            child: Container(
              alignment: Alignment.centerRight,
              height: responsive.heightPercent(2.5),
              width: responsive.widthPercent(11),
              child: topWidget ?? const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class DatingIcons extends StatelessWidget {
  const DatingIcons({
    Key? key,
    required this.principalCircleHight,
    required this.principalCircleWidth,
    required this.secondaryCircleHight,
    required this.secondaryCircleWidth,
    required this.iconSize,
    required this.rightSeparation,
  }) : super(key: key);

  final double principalCircleHight;
  final double principalCircleWidth;
  final double secondaryCircleHight;
  final double secondaryCircleWidth;
  final double iconSize;
  final double rightSeparation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: rightSeparation,
          child: Container(
            height: principalCircleHight,
            width: principalCircleWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: secondaryCircleHight,
                width: secondaryCircleWidth,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/facebook_ui/images/stories/fernanda_preview.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 14,
          child: Container(
            height: principalCircleHight,
            width: principalCircleWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: secondaryCircleHight,
                width: secondaryCircleWidth,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/facebook_ui/images/stories/samanta_preview.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: principalCircleHight,
            width: principalCircleWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: secondaryCircleHight,
                width: secondaryCircleWidth,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/facebook_ui/images/stories/james_preview.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
