import 'package:flutter/material.dart';
import 'package:passenger_app/screens/home.dart';
import 'package:passenger_app/screens/profile_screen.dart';
import 'package:passenger_app/screens/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/search': (context) => Search_Page(),
        '/home': (context) => HomePage(),
        '/person': (context) => Profile_Screen(),
      },
      debugShowCheckedModeBanner: false,
      home: Profile_Screen(),
    );
  }
}
