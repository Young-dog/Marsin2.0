import 'package:flutter/material.dart';
import 'package:marsin/screens/basket.dart';
import 'package:marsin/screens/contacts.dart';
import 'package:marsin/screens/home_page.dart';
import 'package:marsin/screens/shop.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const HomePage(),
      navigatorKey: navigatorKey,
      routes: {
        HomePage.id: (context) => const HomePage(),
        Contacts.id: (context) => const Contacts(),
        Shop.id: (context) => const Shop(),
        Basket.id: (context) => const Basket(),
      },
    );
  }
}

