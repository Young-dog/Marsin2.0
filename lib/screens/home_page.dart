import 'package:flutter/material.dart';
import 'package:marsin/widgets/about_us.dart';

import '../links.dart';
import '../widgets/card.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: backColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CardChoco(),
              AboutUs(),
            ],
          ),
        ),
      ),
    );
  }
}
