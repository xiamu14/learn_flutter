import 'dart:ui';

import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _navCurrentIndex = 0;

  void onTapNavItem(int index) {
    setState(() {
      _navCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          onTap: onTapNavItem,
          currentIndex: _navCurrentIndex,
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
