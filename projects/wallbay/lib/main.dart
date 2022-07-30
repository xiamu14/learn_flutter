import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallbay/bloc/wallpaper_bloc.dart';

import 'screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WallpaperBloc(),
      child: MaterialApp(
        title: 'wallbay',
        theme: ThemeData(
          brightness: Brightness.light,
          cardColor: Colors.white38,
          dialogBackgroundColor: Colors.white,
          primaryColor: Colors.white,
        ),
        home: const HomePage('Wallbay'),
      ),
    );
  }
}
