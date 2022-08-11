import 'package:animax/widgets/anime_card_list.dart';
import 'package:animax/widgets/home_head_banner.dart';
import 'package:anime_api/anime_api.dart';
import 'package:anime_api/model/anime.dart';
import 'package:anime_icons/anime_icons.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static String routePath = '/tabHome';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<AnimeWithEpisode>>? _futureFetchAnimeList;

  @override
  initState() {
    super.initState();
    _futureFetchAnimeList = fetchAnimeList();
  }

  Future<List<AnimeWithEpisode>> fetchAnimeList() async {
    return AnimeApi.getAnimeList();
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      child: Column(
        children: [
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      //  header banner
                      const HomeHeadBanner(),
                      // Top Hits Anime
                      SizedBox(
                        height: 300,
                        child: FutureBuilder<List<AnimeWithEpisode>>(
                            future: _futureFetchAnimeList,
                            builder: (context, snapshot) {
                              return AnimeCardList(
                                title: 'Top Hits Anime',
                                list: snapshot.hasData ? snapshot.data! : [],
                              );
                            }),
                      ),

                      // New Episode Releases
                      SizedBox(
                        height: 300,
                        child: FutureBuilder<List<AnimeWithEpisode>>(
                            future: _futureFetchAnimeList,
                            builder: (context, snapshot) {
                              return AnimeCardList(
                                title: 'New Episode Releases',
                                list: snapshot.hasData ? snapshot.data! : [],
                              );
                            }),
                      ),
                    ],
                  ),
                  const TopBar(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Container(
      width: sw,
      height: sh * 0.12,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff181a20), Color.fromRGBO(24, 26, 0, 0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Align(
        alignment: const Alignment(0, 0.65),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 32.0,
                height: 32.0,
              ),
              const Spacer(),
              const AnimeIcon(
                AnimeIcons.search,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              const AnimeIcon(
                AnimeIcons.notification,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
