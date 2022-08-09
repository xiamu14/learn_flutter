import 'package:animax/screens/detail.dart';
import 'package:animax/screens/edit_profile.dart';
import 'package:animax/screens/episode_release.dart';
import 'package:animax/screens/init_setting.dart';
import 'package:animax/screens/player.dart';
import 'package:animax/screens/profile.dart';
import 'package:animax/screens/sign.dart';
import 'package:animax/screens/tab_box.dart';
import 'package:animax/screens/top_hits.dart';
import 'package:animax/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(AppWithRoutes());
}

class AppWithRoutes extends StatelessWidget {
  AppWithRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Animax',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff06C149),
        brightness: Brightness.light,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: Welcome.routePath,
        builder: ((context, state) => const Welcome()),
      ),
      GoRoute(
        path: Sign.routePath,
        builder: ((context, state) => const Sign()),
      ),
      GoRoute(
        path: InitSetting.routePath,
        builder: ((context, state) => const InitSetting()),
      ),
      GoRoute(
        path: EditProfile.routePath,
        builder: ((context, state) => const EditProfile()),
      ),
      GoRoute(
        path:
            '/:screen(tabHome|tabProfile|tabMyList|tabDownload|tabReleaseCalendar)', // don't dynamic
        builder: (BuildContext context, GoRouterState state) {
          final String screen = state.params['screen']!;
          return TabBox(screen: screen);
        },
      ),
      GoRoute(
        path: AnimeDetail.routePath,
        builder: ((context, state) => const AnimeDetail()),
      ),
      GoRoute(
        path: AnimePlayer.routePath,
        builder: (context, GoRouterState state) {
          final String animeId = state.queryParams['animeId']!;
          final String index = state.queryParams['index']!;
          return AnimePlayer(
            animeId: animeId,
            index: index,
          );
        },
      ),
      GoRoute(
        path: TopHits.routePath,
        builder: ((context, state) => const TopHits()),
      ),
      GoRoute(
        path: EpisodeRelease.routePath,
        builder: ((context, state) => const EpisodeRelease()),
      ),
    ],
    initialLocation: EditProfile.routePath,
  );
}
