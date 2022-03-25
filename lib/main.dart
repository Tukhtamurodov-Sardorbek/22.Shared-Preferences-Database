import 'package:flutter/material.dart';
import 'package:sharedpreferencesdb/pages/home_assignment1.dart';
import 'package:sharedpreferencesdb/pages/home_assignment2.dart';
import 'package:sharedpreferencesdb/pages/home_page.dart';
import 'package:sharedpreferencesdb/pages/optimized_version.dart';
import 'package:sharedpreferencesdb/pages/simple_version.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        SimpleVersion.id: (context) => const SimpleVersion(),
        OptimizedVersion.id: (context) => const OptimizedVersion(),
        HomeAssignmentOne.id: (context) => const HomeAssignmentOne(),
        HomeAssignmentTwo.id: (context) => const HomeAssignmentTwo(),
      },
    );
  }
}