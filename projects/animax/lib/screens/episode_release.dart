import 'package:animax/widgets/anime_card.dart';
import 'package:animax/widgets/custom_app_bar.dart';
import 'package:anime_icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EpisodeRelease extends StatelessWidget {
  const EpisodeRelease({Key? key}) : super(key: key);

  static String routePath = '/episodeRelease';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'New Episode Releases',
                iconName: AnimeIcons.search,
                leadingBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GridView(
                    padding: const EdgeInsets.all(0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.0,
                            crossAxisSpacing: 12.0,
                            childAspectRatio: 150 / 200),
                    children: const [
                      AnimeCard(
                        image: 'assets/poster/001_1.jpeg',
                      ),
                      AnimeCard(
                        image: 'assets/poster/002_1.jpeg',
                      ),
                      AnimeCard(
                        image: 'assets/poster/003_1.jpeg',
                      ),
                      AnimeCard(
                        image: 'assets/poster/001_1.jpeg',
                      ),
                      AnimeCard(
                        image: 'assets/poster/001_1.jpeg',
                      ),
                      AnimeCard(
                        image: 'assets/poster/002_1.jpeg',
                      ),
                      AnimeCard(
                        image: 'assets/poster/003_1.jpeg',
                      ),
                      AnimeCard(
                        image: 'assets/poster/001_1.jpeg',
                      ),
                    ],
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
