import 'package:flutter/material.dart';
import 'package:marsin/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "IBMPlexSans"),
      home: const HomePage(),
      navigatorKey: navigatorKey,
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}

