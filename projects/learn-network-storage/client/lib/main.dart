import 'package:client/api/get_course.dart';
import 'package:flutter/material.dart';

import 'model/course.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Course> futureCourse;

  @override
  void initState() {
    super.initState();
    futureCourse = getCourse('12');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              (snapshot.data as Course).toJson();
              return Text((snapshot.data as Course).courseName!);
            } else if (snapshot.hasError) {
              return const Text('network error!');
            }
            return const CircularProgressIndicator();
          },
          future: futureCourse,
        ),
      ),
    );
  }
}
