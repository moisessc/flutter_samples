import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../utils/responsive.dart';
import '../../data/post.dart';
import '../../theme/theme_state.dart';
import '../../widgets/avatar_icon.dart';
import '../../widgets/circle_button.dart';
import '../../widgets/reaction_icons.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);

    return Container(
      height: responsive.heightPercent(55),
      margin: const EdgeInsets.only(
        bottom: 45,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: (themeState.isDarkTheme)
            ? Theme.of(context).backgroundColor
            : const Color(0xfffafafa),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 10.0,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: responsive.heightPercent(2),
          right: responsive.heightPercent(1.5),
          left: responsive.heightPercent(1.5),
        ),
        child: Column(
          children: [
            _HeaderPost(post: post),
            SizedBox(height: responsive.heightPercent(1.5)),
            Container(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                '${post.descriptionPost}',
                style: TextStyle(
                  fontSize: responsive.widthPercent(3.1),
                  color: Theme.of(context).accentColor,
                ),
                textAlign: TextAlign.start,
                minFontSize: 10,
                maxLines: 1,
              ),
            ),
            SizedBox(height: responsive.widthPercent(1.5)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      '${post.postImage}',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(
                    responsive.widthPercent(3.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.heightPercent(1)),
            _CommentsAndSharedCount(post: post),
            SizedBox(height: responsive.heightPercent(1)),
            _ReactionsSection(post: post),
            const Divider(thickness: 2),
            _CommentsSection(comment: post.comment)
          ],
        ),
      ),
    );
  }
}

class _HeaderPost extends StatelessWidget {
  const _HeaderPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.widthPercent(2.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: responsive.heightPercent(4),
            width: responsive.heightPercent(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  '${post.userProfileIcon}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: responsive.widthPercent(3)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${post.userName}',
                  style: TextStyle(
                    color: (themeState.isDarkTheme)
                        ? Theme.of(context).accentColor
                        : const Color(0xff1e3067),
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.widthPercent(3.5),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/facebook_ui/icons/globe.svg',
                    ),
                    SizedBox(
                      width: responsive.widthPercent(2),
                    ),
                    Text(
                      '${post.timePost}',
                      style: TextStyle(
                        color: const Color(0xffc2c5cf),
                        fontSize: responsive.widthPercent(2.5),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: responsive.widthPercent(3)),
          Row(
            children: [
              CircleButton(
                callback: () => debugPrint('Star'),
                height: responsive.widthPercent(6),
                width: responsive.widthPercent(6),
                icon: FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: (themeState.isDarkTheme)
                      ? Theme.of(context).accentColor
                      : const Color(0xff3ca1f5),
                  size: responsive.heightPercent(1),
                ),
                backgroundColor: (themeState.isDarkTheme)
                    ? const Color(0xff1f232c)
                    : const Color(0xfff1f4f8),
              ),
              const SizedBox(width: 5),
              CircleButton(
                callback: () => debugPrint('Dots'),
                height: responsive.widthPercent(6),
                width: responsive.widthPercent(6),
                icon: FaIcon(
                  FontAwesomeIcons.ellipsisH,
                  color: (themeState.isDarkTheme)
                      ? Theme.of(context).accentColor
                      : const Color(0xffa1a8bf),
                  size: responsive.heightPercent(1.6),
                ),
                backgroundColor: (themeState.isDarkTheme)
                    ? const Color(0xff1f232c)
                    : const Color(0xfff1f4f8),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _CommentsAndSharedCount extends StatelessWidget {
  const _CommentsAndSharedCount({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${post.comments} comentarios',
          style: TextStyle(
            fontSize: responsive.widthPercent(2.5),
            color: (themeState.isDarkTheme)
                ? Theme.of(context).accentColor
                : const Color(0xff808aa9),
          ),
        ),
        Container(
          height: 2,
          width: 2,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
            color: Color(0xff808aa9),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          '${post.shared} compartidos',
          style: TextStyle(
            fontSize: responsive.widthPercent(2.5),
            color: (themeState.isDarkTheme)
                ? Theme.of(context).accentColor
                : const Color(0xff808aa9),
          ),
        )
      ],
    );
  }
}

class _ReactionsSection extends StatelessWidget {
  const _ReactionsSection({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);
    final principalReaction = post.principalUserReaction;
    final reactionsCount = post.reactions;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: responsive.widthPercent(35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleButton(
                callback: () => debugPrint('Like'),
                height: responsive.widthPercent(7.5),
                width: responsive.widthPercent(7.5),
                icon: SvgPicture.asset(
                  'assets/facebook_ui/icons/like_icon.svg',
                  color: (themeState.isDarkTheme)
                      ? Theme.of(context).accentColor
                      : const Color(0xff364987),
                  height: responsive.widthPercent(3),
                  fit: BoxFit.cover,
                ),
                backgroundColor: (themeState.isDarkTheme)
                    ? const Color(0xff1f232c)
                    : const Color(0xffffffff),
              ),
              CircleButton(
                callback: () => debugPrint('Comment'),
                height: responsive.widthPercent(7.5),
                width: responsive.widthPercent(7.5),
                icon: SvgPicture.asset(
                  'assets/facebook_ui/icons/comment_icon.svg',
                  color: (themeState.isDarkTheme)
                      ? Theme.of(context).accentColor
                      : const Color(0xff364987),
                  height: responsive.widthPercent(3),
                  fit: BoxFit.cover,
                ),
                backgroundColor: (themeState.isDarkTheme)
                    ? const Color(0xff1f232c)
                    : const Color(0xffffffff),
              ),
              CircleButton(
                callback: () => debugPrint('Share'),
                height: responsive.widthPercent(7.5),
                width: responsive.widthPercent(7.5),
                icon: SvgPicture.asset(
                  'assets/facebook_ui/icons/share_icon.svg',
                  color: (themeState.isDarkTheme)
                      ? Theme.of(context).accentColor
                      : const Color(0xff364987),
                  height: responsive.widthPercent(3),
                  fit: BoxFit.cover,
                ),
                backgroundColor: (themeState.isDarkTheme)
                    ? const Color(0xff1f232c)
                    : const Color(0xffffffff),
              ),
            ],
          ),
        ),
        Container(
          width: responsive.widthPercent(50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  '$principalReaction y $reactionsCount personas más',
                  style: TextStyle(
                    fontSize: responsive.widthPercent(2.7),
                    fontWeight: FontWeight.w500,
                    color: (themeState.isDarkTheme)
                        ? Theme.of(context).accentColor
                        : const Color(0xff808aa9),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Expanded(
                child: Container(
                  height: responsive.widthPercent(5.5),
                  child: Reactions(
                    iconSize: responsive.widthPercent(2.2),
                    rightSeparation: responsive.widthPercent(4.2),
                    principalCircleHight: responsive.widthPercent(5),
                    principalCircleWidth: responsive.widthPercent(5),
                    secondaryCircleHight: responsive.widthPercent(4),
                    secondaryCircleWidth: responsive.widthPercent(4),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _CommentsSection extends StatelessWidget {
  const _CommentsSection({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            child: AvatarIcon(
              profileImage: '${comment.userProfileIcon}',
              child: const SizedBox(),
              height: responsive.widthPercent(7),
              width: responsive.widthPercent(7),
              marginColor: (themeState.isDarkTheme)
                  ? const Color(0xffffffff)
                  : Colors.transparent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${comment.userName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.widthPercent(2.7),
                  color: (themeState.isDarkTheme)
                      ? Theme.of(context).accentColor
                      : const Color(0xff000000),
                ),
              ),
              Text(
                '${comment.comment}',
                style: TextStyle(
                  color: (themeState.isDarkTheme)
                      ? Theme.of(context).accentColor
                      : const Color(0xff899cb1),
                  fontSize: responsive.widthPercent(2.5),
                ),
              ),
              SizedBox(height: responsive.widthPercent(1)),
              Container(
                width: responsive.widthPercent(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Me gusta',
                      style: TextStyle(
                        color: const Color(0xff495b92),
                        fontSize: responsive.widthPercent(2.8),
                      ),
                    ),
                    Text(
                      'Responder',
                      style: TextStyle(
                        color: const Color(0xff495b92),
                        fontSize: responsive.widthPercent(2.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
