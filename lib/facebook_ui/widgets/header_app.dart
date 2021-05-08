import 'package:flutter/material.dart';
import 'package:flutter_samples/facebook_ui/screens/profile_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';
import '../theme/theme_state.dart';
import '../widgets/avatar_icon.dart';
import '../widgets/circle_button.dart';
import '../widgets/large_button.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    const profileImage = 'assets/common/images/profile_image.jpg';

    return Container(
      height: responsive.heightPercent(25),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: responsive.widthPercent(4.5),
              child: Column(
                children: [
                  const Divider(thickness: 2),
                  SizedBox(height: responsive.widthPercent(1)),
                  const _PostBar(profileImage: profileImage),
                  SizedBox(height: responsive.heightPercent(2.5)),
                  const PostActions(),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: const _FacebookAppBar(profileImage: profileImage),
            ),
          ],
        ),
      ),
    );
  }
}

class _FacebookAppBar extends StatelessWidget {
  const _FacebookAppBar({
    Key? key,
    required this.profileImage,
  }) : super(key: key);

  final String profileImage;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final themeState = Provider.of<ThemeState>(context);
    final accentColor = Theme.of(context).accentColor;

    const searchIcon = 'assets/facebook_ui/icons/search_icon.svg';

    return Padding(
      padding: EdgeInsets.only(top: responsive.heightPercent(1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            callback: () => debugPrint('Facebook'),
            icon: FittedBox(
              fit: BoxFit.none,
              child: FaIcon(
                FontAwesomeIcons.facebook,
                size: responsive.widthPercent(8.5),
                color: const Color(0xff3284f5),
                textDirection: TextDirection.ltr,
              ),
            ),
            backgroundColor: Colors.white,
            height: responsive.widthPercent(8),
            width: responsive.widthPercent(8),
          ),
          Container(
            width: responsive.widthPercent(48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleButton(
                  callback: () => debugPrint('Search'),
                  icon: SvgPicture.asset(
                    searchIcon,
                    color: accentColor,
                    height: responsive.widthPercent(4),
                  ),
                  backgroundColor: Theme.of(context).buttonColor,
                  height: responsive.widthPercent(8.5),
                  width: responsive.widthPercent(8.5),
                ),
                Stack(
                  children: [
                    CircleButton(
                      callback: () => debugPrint('Bell'),
                      icon: FaIcon(
                        FontAwesomeIcons.solidBell,
                        size: responsive.widthPercent(4.2),
                        color: accentColor,
                      ),
                      backgroundColor: Theme.of(context).buttonColor,
                      height: responsive.widthPercent(8.5),
                      width: responsive.widthPercent(8.5),
                    ),
                    Positioned(
                      right: 6,
                      top: 4,
                      child: Container(
                        height: responsive.heightPercent(0.9),
                        width: responsive.heightPercent(0.9),
                        decoration: const BoxDecoration(
                          color: Color(0xffee305e),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                CircleButton(
                  callback: () => debugPrint('Messenger'),
                  icon: FaIcon(
                    FontAwesomeIcons.facebookMessenger,
                    size: responsive.widthPercent(4.2),
                    color: (themeState.isDarkTheme)
                        ? accentColor
                        : const Color(0xff3ca1f5),
                  ),
                  backgroundColor: Theme.of(context).buttonColor,
                  height: responsive.widthPercent(8.5),
                  width: responsive.widthPercent(8.5),
                ),
                const SizedBox(width: 1),
                ClipOval(
                  child: Hero(
                    tag: profileImage,
                    child: AvatarIcon(
                      profileImage: profileImage,
                      marginColor: (themeState.isDarkTheme)
                          ? Theme.of(context).accentColor
                          : Colors.transparent,
                      height: responsive.widthPercent(8.5),
                      width: responsive.widthPercent(8.5),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ProfileScreen(),
                            ),
                          ),
                          child: const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostBar extends StatelessWidget {
  const _PostBar({
    Key? key,
    required this.profileImage,
  }) : super(key: key);

  final String profileImage;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);
    const smileIcon = 'assets/facebook_ui/icons/smile_icon.png';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvatarIcon(
          profileImage: profileImage,
          height: responsive.widthPercent(6),
          width: responsive.widthPercent(6),
          marginWidth: 1.5,
          child: const SizedBox(),
          marginColor: (themeState.isDarkTheme)
              ? Theme.of(context).accentColor
              : Colors.transparent,
        ),
        SizedBox(width: responsive.widthPercent(2)),
        Container(
          width: responsive.widthPercent(70),
          height: responsive.widthPercent(6.5),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: '¿Qué estas pensado, Moisés?',
              hintStyle: TextStyle(
                fontSize: responsive.widthPercent(3.5),
                color: (themeState.isDarkTheme)
                    ? Theme.of(context).accentColor
                    : const Color(0xff9aa2bf),
              ),
            ),
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: responsive.heightPercent(1.5),
            ),
          ),
        ),
        ClipOval(
          child: Container(
            height: responsive.widthPercent(5),
            width: responsive.widthPercent(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(smileIcon),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => debugPrint('Smile'),
                child: const Center(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PostActions extends StatelessWidget {
  const PostActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LargeButton(
          callback: () => debugPrint('Fotos'),
          text: 'Fotos',
          height: responsive.heightPercent(4),
          width: responsive.widthPercent(27),
          icon: const FaIcon(
            FontAwesomeIcons.camera,
            color: Color(0xff76c997),
            size: 14,
          ),
          fontSize: responsive.heightPercent(1),
        ),
        LargeButton(
          callback: () => debugPrint('En vivo'),
          text: 'En vivo',
          height: responsive.heightPercent(4),
          width: responsive.widthPercent(27),
          icon: Stack(
            children: [
              const FaIcon(
                FontAwesomeIcons.video,
                color: Color(0xffee305e),
                size: 14,
              ),
              Positioned(
                left: 2,
                top: 3,
                child: Container(
                  height: 3,
                  width: 3,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          fontSize: responsive.heightPercent(1),
        ),
        LargeButton(
          height: responsive.heightPercent(4),
          width: responsive.widthPercent(30),
          callback: () => debugPrint('Video corto'),
          text: 'Video corto',
          icon: const FaIcon(
            FontAwesomeIcons.eye,
            color: Color(0xff3284f5),
            size: 14,
          ),
          fontSize: responsive.heightPercent(1),
        )
      ],
    );
  }
}
