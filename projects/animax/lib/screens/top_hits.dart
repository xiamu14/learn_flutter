import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/top_hits_anime.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopHits extends StatefulWidget {
  const TopHits({Key? key}) : super(key: key);

  static String routePath = '/topHits';

  @override
  State<TopHits> createState() => _TopHitsState();
}

class _TopHitsState extends State<TopHits> {
  @override
  Widget build(BuildContext context) {
    // final sw = MediaQuery.of(context).size.width;
    // final sh = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Top Hits Anime',
                iconName: AnimeIcons.search,
                leadingBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return const TopHitsAnimeItem();
                    }),
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
