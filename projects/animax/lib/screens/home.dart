import 'package:animax/widgets/anime_card_list.dart';
import 'package:animax/widgets/home_head_banner.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static String routePath = '/tabHome';

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      child: Column(
        children: [
          //  header banner
          const HomeHeadBanner(),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView(
                children: const [
                  // Top Hits Anime
                  SizedBox(
                    height: 300,
                    child: AnimeCardList(
                      title: 'Top Hits Anime',
                    ),
                  ),

                  // New Episode Releases
                  SizedBox(
                    height: 300,
                    child: AnimeCardList(
                      title: 'New Episode Releases',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
