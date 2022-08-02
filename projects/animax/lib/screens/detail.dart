import 'package:animax/widgets/button.dart';
import 'package:animax/widgets/tag.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

class AnimeDetail extends StatelessWidget {
  const AnimeDetail({Key? key}) : super(key: key);

  static String routePath = '/animeDetail';

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Stack(children: [
            ListView(
              padding: const EdgeInsets.only(top: 0.0),
              children: [
                Image(
                  width: sw,
                  height: sh * 0.35,
                  image: const AssetImage('assets/poster/001_0.jpeg'),
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
                          'Demon Slayer (Kimetsu no Yaiba)',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        )),
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
                          '10.0',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
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
                          '2022',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              color: Color(0xff424242),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Tag(text: '13+', color: Theme.of(context).primaryColor),
                        const SizedBox(
                          width: 12,
                        ),
                        Tag(
                          text: 'Japan',
                          color: Theme.of(context).primaryColor,
                        )
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
                    )
                    // introduction
                  ]),
                ),
              ],
            ),
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
                  children: const [
                    AnimeIcon(
                      AnimeIcons.arrowLeft,
                      color: Colors.white,
                      size: 24,
                    ),
                    AnimeIcon(
                      AnimeIcons.bookmark,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
