import 'package:animax/screens/detail.dart';
import 'package:animax/screens/player.dart';
import 'package:anime_api/anime_api.dart';
import 'package:anime_api/model/anime.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHeadBanner extends StatefulWidget {
  const HomeHeadBanner({Key? key}) : super(key: key);

  @override
  State<HomeHeadBanner> createState() => _HomeHeadBannerState();
}

class _HomeHeadBannerState extends State<HomeHeadBanner> {
  Future<Anime>? _futureFetchAnimePopular;

  @override
  initState() {
    super.initState();
    _futureFetchAnimePopular = fetchAnimePopular();
  }

  Future<Anime> fetchAnimePopular() async {
    return AnimeApi.getAnimePopular();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        FutureBuilder<Anime>(
            future: _futureFetchAnimePopular,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Container(
                  width: sw,
                  height: sh * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    // image: NetworkImage(data.cover),
                    image: CachedNetworkImageProvider(
                      data.cover,
                    ),
                    fit: BoxFit.cover,
                  )),
                );
              }
              return Container();
            }),
        FutureBuilder<Anime>(
            future: _futureFetchAnimePopular,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: sw,
                    height: sh * 0.2,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(24, 26, 0, 0),
                        Color(0xff181a20),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: sw * 0.6,
                            child: Text(
                              data.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: sw * 0.8,
                            child: Text(
                              data.introduction,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              ButtonPlay(
                                animeId: data.id.toString(),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  // width: 84,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Center(
                                      child: Text(
                                        '+  My List',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            })
      ],
    );
  }
}

class ButtonPlay extends StatelessWidget {
  const ButtonPlay({
    Key? key,
    required this.animeId,
  }) : super(key: key);

  final String animeId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('${AnimeDetail.routePath}?animeId=$animeId');
      },
      child: Container(
        // width: 84,
        height: 32,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Center(
            child: Row(
              children: const [
                AnimeIcon(
                  AnimeIcons.playBold,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  'Play',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
