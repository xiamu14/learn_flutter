import 'dart:ui';

import 'package:animax/screens/home.dart';
import 'package:animax/screens/profile.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _navCurrentIndex = 0;

  void onTapNavItem(BuildContext context, int index) {
    if (index == 0) {
      GoRouter.of(context).go(Home.routePath);
    }
    if (index == 4) {
      GoRouter.of(context).go(Profile.routePath);
    }
    setState(() {
      _navCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final currentIndex = router.location == Profile.routePath ? 4 : 0;
    return Stack(
      children: [
        Positioned.fill(
          // ?? 磨砂效果没有出现
          bottom: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
          ),
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            onTapNavItem(context, value);
          },
          currentIndex: currentIndex,
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
      ],
    );
  }
}
