import 'package:animax/screens/detail.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeadBanner extends StatelessWidget {
  const HeadBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Container(
      width: sw,
      height: sh * 0.4,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/poster/001_0.jpeg'),
        fit: BoxFit.cover,
      )),
      child: Stack(
        children: [
          Container(
            width: sw,
            height: sh * 0.13,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff181a20), Color.fromRGBO(24, 26, 0, 0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
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
          ),
          Positioned(
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
                    const Text(
                      "Demon Slayer: Kimetsu...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Action, Shounen, Martial Arts, Adventure, ...",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go(AnimeDetail.routePath);
                          },
                          child: Container(
                            // width: 84,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
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
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            // width: 84,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
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
          )
        ],
      ),
    );
  }
}
