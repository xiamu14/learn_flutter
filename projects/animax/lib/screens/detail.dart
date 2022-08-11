import 'package:animax/widgets/button.dart';
import 'package:animax/widgets/detail_tab_view.dart';
import 'package:animax/widgets/episode_card_list.dart';
import 'package:animax/widgets/tag.dart';
import 'package:anime_api/api/anime.dart';
import 'package:anime_api/model/anime.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import 'package:readmore/readmore.dart';

class AnimeDetail extends StatefulWidget {
  const AnimeDetail({Key? key, required this.animeId}) : super(key: key);

  static String routePath = '/animeDetail';

  final String animeId;

  @override
  State<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  Future<AnimeWithEpisode> fetchAnime(int id) async {
    return AnimeApi.getAnimeById(int.parse(widget.animeId));
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
                future: fetchAnime(4),
                builder: (context, AsyncSnapshot<AnimeWithEpisode> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView(
                      padding: const EdgeInsets.only(top: 0.0),
                      children: [
                        Image(
                          width: sw,
                          height: sh * 0.35,
                          image: NetworkImage(data.cover),
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 24,
                          ),
                          child: Column(children: [
                            // title
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    data.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                const AnimeIcon(AnimeIcons.send),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            // tags and release year ...
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AnimeIcon(
                                  AnimeIcons.starBold,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  data.score.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                AnimeIcon(
                                  AnimeIcons.arrowRight,
                                  color: Theme.of(context).primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  data.release,
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                      color: Color(0xff424242),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: data.tags
                                      .getRange(0, 1)
                                      .map(
                                        (e) => Row(
                                          children: [
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Tag(
                                                text: e,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            // button group
                            Row(
                              children: [
                                Button(
                                  onTap: () {},
                                  text: 'Play',
                                  width: 146.0,
                                  icon: AnimeIcons.playBold,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Button(
                                  onTap: () {},
                                  text: 'Download',
                                  width: 146.0,
                                  solid: false,
                                  icon: AnimeIcons.downloadBold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            ReadMoreText(
                              data.introduction,
                              trimLines: 3,
                              colorClickableText:
                                  Theme.of(context).primaryColor,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'View More',
                              trimExpandedText: 'Show Less',
                              lessStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                              moreStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            EpisodeCardList(
                              list: data.episodes,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const DetailTabView(),
                            // introduction
                          ]),
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: sw,
                height: 140,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff181a20), Color.fromRGBO(24, 26, 0, 0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (GoRouter.of(context).canPop()) {
                          GoRouter.of(context).pop();
                        }
                      },
                      child: const AnimeIcon(
                        AnimeIcons.arrowLeft,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const AnimeIcon(
                      AnimeIcons.bookmark,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
