import 'package:animax/screens/detail.dart';
import 'package:animax/screens/home.dart';
import 'package:animax/screens/player.dart';
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
        path: Home.routePath,
        builder: ((context, state) => const Home()),
      ),
      GoRoute(
        path: AnimePlayer.routePath,
        builder: ((context, state) => const AnimePlayer(
              videoUrl:
                  'https://v6-default.ixigua.com/51d1db8bf0681e23d739bb25d5c678ac/62e8802a/video/tos/cn/tos-cn-ve-0030/141db20233d44b7da9ff6a9bcd72b8e3/?www.nftvio.com&filename=720P.mp4',
            )),
      ),
    ],
    initialLocation: Home.routePath,
  );
}
