import 'package:animax/screens/player.dart';
import 'package:anime_api/model/anime.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EpisodeCardList extends StatelessWidget {
  const EpisodeCardList({Key? key, required this.list}) : super(key: key);

  final List<Episode> list;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Episodes',
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'Season ${list.length}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimeIcon(
                  AnimeIcons.arrowRight,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: sw,
        height: 112,
        child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              final episode = list[index];
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                          '${AnimePlayer.routePath}?animeId=${episode.animeId}&index=${episode.index}');
                    },
                    child: Container(
                      width: 150,
                      height: 112,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(list[index].cover),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(children: [
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: AnimeIcon(
                              AnimeIcons.playBold,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: 150,
                            height: 30,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(24, 26, 0, 0),
                                  Color(0xff181a20),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Episode ${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              );
            })),
      ),
    ]);
  }
}
