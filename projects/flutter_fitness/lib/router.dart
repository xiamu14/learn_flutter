import 'package:flutter/material.dart';
import 'package:flutter_fitness/pages/root_app.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case '/root_app':
      return MaterialPageRoute(builder: (context) => const RootApp());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(),
        ),
      );
  }
}
