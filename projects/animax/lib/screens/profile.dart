import 'package:animax/widgets/custom_app_bar.dart';
import 'package:anime_icons/icons.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static String routePath = '/tabProfile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Profile',
            iconName: AnimeIcons.moreCircle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: const []),
            ),
          ),
        ],
      ),
    );
  }
}
