import 'package:flutter/material.dart';
import 'package:wallet_app_ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet App',
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
