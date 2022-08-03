import 'dart:ui';

import 'package:animax/screens/home.dart';
import 'package:animax/screens/profile.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabItem {
  final String routePath;
  final SystemUiOverlayStyle overlayStyle;
  final Widget screenWidget;

  TabItem({
    required this.screenWidget,
    required this.routePath,
    required this.overlayStyle,
  });
}

final List<TabItem> tabs = [
  TabItem(
    screenWidget: const Home(),
    routePath: Home.routePath,
    overlayStyle: SystemUiOverlayStyle.light,
  ),
  TabItem(
    screenWidget: const Home(),
    routePath: '/tabRelease',
    overlayStyle: SystemUiOverlayStyle.light,
  ),
  TabItem(
    screenWidget: const Home(),
    routePath: '/tabMyList',
    overlayStyle: SystemUiOverlayStyle.light,
  ),
  TabItem(
    screenWidget: const Home(),
    routePath: '/tabDownload',
    overlayStyle: SystemUiOverlayStyle.light,
  ),
  TabItem(
    screenWidget: const Profile(),
    routePath: Profile.routePath,
    overlayStyle: SystemUiOverlayStyle.dark,
  ),
];

class TabBox extends StatefulWidget {
  const TabBox({super.key, required this.screen});

  final String screen;

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int _navCurrentIndex = 0;
  Widget _screen = Container();

  @override
  void initState() {
    super.initState();
    print(widget.screen);
    final index =
        tabs.indexWhere((element) => element.routePath == '/${widget.screen}');

    setState(() {
      _screen = tabs[index].screenWidget;
      _navCurrentIndex = index;
    });
  }

  void onTapNavItem(int index) {
    setState(() {
      _navCurrentIndex = index;
      final tabItem = tabs[index];
      _screen = tabItem.screenWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: tabs[_navCurrentIndex].overlayStyle,
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              reverseDuration: const Duration(milliseconds: 0),
              child: _screen,
            ),
            NavigationBar(
              currentIndex: _navCurrentIndex,
              onTapNavItem: onTapNavItem,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTapNavItem,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index) onTapNavItem;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Opacity(
            opacity: 0.8,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: onTapNavItem,
              currentIndex: currentIndex,
              // backgroundColor: Colors.transparent,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: const Color(0xff9E9E9E),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: AnimeIcon(AnimeIcons.home),
                  activeIcon: AnimeIcon(AnimeIcons.homeBold),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: AnimeIcon(AnimeIcons.calendar),
                  activeIcon: AnimeIcon(AnimeIcons.calendarBold),
                  label: 'Release Calendar',
                ),
                BottomNavigationBarItem(
                  icon: AnimeIcon(AnimeIcons.bookmark),
                  activeIcon: AnimeIcon(AnimeIcons.bookmarkBold),
                  label: 'My List',
                ),
                BottomNavigationBarItem(
                  icon: AnimeIcon(AnimeIcons.download),
                  activeIcon: AnimeIcon(AnimeIcons.downloadBold),
                  label: 'Download',
                ),
                BottomNavigationBarItem(
                  icon: AnimeIcon(AnimeIcons.profile),
                  activeIcon: AnimeIcon(AnimeIcons.profileBold),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
