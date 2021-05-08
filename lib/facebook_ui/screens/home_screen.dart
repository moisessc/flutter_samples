import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';
import '../data/local_providers.dart';
import '../data/post.dart';
import '../widgets/header_app.dart';
import '../widgets/home_screen/posts.dart';
import '../widgets/home_screen/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  late bool _showBottomBar;

  void _showBottomBarByScroll(BuildContext context) {
    final bottomBarState = Provider.of<BottomBarState>(context, listen: false);

    _showBottomBar = bottomBarState.showBottomBar;

    if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        _showBottomBar) {
      bottomBarState.showBottomBar = false;
    } else if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        !_showBottomBar) {
      bottomBarState.showBottomBar = true;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              _showBottomBarByScroll(context);
              return true;
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: CustomSliverHeader(
                    maxHeight: responsive.heightPercent(25),
                    minHeight: responsive.heightPercent(11),
                    child: const HeaderApp(),
                  ),
                ),
                const SliverToBoxAdapter(child: Stories()),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => PostWidget(post: posts[index]),
                    childCount: posts.length,
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

class CustomSliverHeader extends SliverPersistentHeaderDelegate {
  CustomSliverHeader({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  }) : assert(maxHeight > minHeight);

  final double maxHeight;
  final double minHeight;
  final Widget child;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) =>
      SizedBox.expand(child: child);

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant CustomSliverHeader oldDelegate) =>
      maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
}
