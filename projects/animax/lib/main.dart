import 'package:animax/screens/detail.dart';
import 'package:animax/screens/home.dart';
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
        path: AnimeDetail.routePath,
        builder: ((context, state) => const AnimeDetail()),
      ),
    ],
    initialLocation: Home.routePath,
  );
}
