import 'package:flutter/material.dart';
import 'package:learn_router/model/book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Book> books = [
      Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
      Book('Too Like the Lightning', 'Ada Palmer'),
      Book('Kindred', 'Octavia E. Butler'),
    ];
    return MaterialApp(
      title: 'learn_router',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: Scaffold(
              body: Center(
                child: Text('BooksListPage'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
