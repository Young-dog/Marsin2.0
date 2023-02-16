import 'package:flutter/material.dart';
import 'package:marsin/main.dart';
import 'package:marsin/screens/contacts.dart';
import 'package:marsin/screens/home_page.dart';
import 'package:marsin/screens/shop.dart';

import '../screens/basket.dart';

final appbar = AppBar(
  backgroundColor: Color(0xFF5f0f40),
  title: TextButton(
    child: Text("Marsin",
        style: TextStyle(fontFamily: "Satisfy", fontSize: 35, color: Colors.white)),
    onPressed: () {
      navigatorKey.currentState?.popAndPushNamed(HomePage.id);
    },
  ),
  actions: [
    TextButton(
      child: Text("contacts",
          style: TextStyle(fontFamily: "Julee", fontSize: 25, color: Colors.white)),
      onPressed: () {
        navigatorKey.currentState?.popAndPushNamed(Contacts.id);
      },
    ),
    TextButton(
      child: Text("shop",
          style: TextStyle(fontFamily: "Julee", fontSize: 25, color: Colors.white)),
      onPressed: () {
        navigatorKey.currentState?.popAndPushNamed(Shop.id);
      },
    ),
    IconButton(onPressed: () {
      navigatorKey.currentState?.popAndPushNamed(Basket.id);
    }, icon: const Icon( Icons.shopping_basket, ),)
  ],
);

