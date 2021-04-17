import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../utils/responsive.dart';
import '../../data/storie.dart';
import '../../theme/theme_state.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      height: responsive.widthPercent(31),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: ListView.builder(
        itemCount: stories.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return StorieWidget(storie: stories[index]);
        },
      ),
    );
  }
}

class StorieWidget extends StatelessWidget {
  const StorieWidget({
    Key? key,
    required this.storie,
  }) : super(key: key);

  final Storie storie;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);
    final previewStory = storie.previewStory;
    final userImage = storie.userImage;
    final userName = storie.userName;
    final dotPattern =
        (userImage == 'none') ? List.of([3.5]) : List.of([130.0]);

    return Container(
      width: responsive.widthPercent(20),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: LayoutBuilder(builder: (_, constraints) {
        return Stack(
          children: [
            LayoutBuilder(
              builder: (_, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: responsive.heightPercent(1.5),
                      ),
                      height: (constraints.maxHeight > 115)
                          ? constraints.maxHeight * .55
                          : constraints.maxHeight * .63,
                      width: constraints.maxWidth * .9,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(previewStory),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            BorderRadius.circular(responsive.widthPercent(6.5)),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                            responsive.widthPercent(6.5),
                          ),
                          onTap: () => debugPrint(
                            '$userName',
                          ),
                          child: const SizedBox(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              right: 1,
              left: 1,
              // top: 1,
              bottom: (constraints.maxHeight > 115)
                  ? constraints.maxWidth / 5
                  : constraints.maxWidth / 50,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(30),
                      padding: const EdgeInsets.all(1),
                      dashPattern: dotPattern,
                      color: const Color(0xff3ca1f5),
                      strokeWidth: 1.5,
                      child: Container(
                        height: responsive.widthPercent(6),
                        width: responsive.widthPercent(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: const Color(0xff3284f5),
                            backgroundImage: (userImage == 'none')
                                ? null
                                : AssetImage(userImage),
                            child: (userImage == 'none')
                                ? const FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 7,
                                  )
                                : null,
                            maxRadius: responsive.heightPercent(1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: responsive.widthPercent(2.7),
                        fontWeight: FontWeight.w400,
                        color: (themeState.isDarkTheme)
                            ? const Color(0xffd4d5d8)
                            : const Color(0xff747c96),
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
