import 'package:flutter/material.dart';
import 'package:marsin/widgets/about_us.dart';
import 'package:marsin/widgets/advantages.dart';
import 'package:marsin/widgets/feedback.dart';
import 'package:marsin/widgets/navigation_bar.dart';
import 'package:marsin/widgets/pc/desert_catigories_for_pc.dart';
import 'package:marsin/widgets/pc/feedback_for_pc.dart';
import 'package:marsin/widgets/pc/visiting_card_for_pc.dart';

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
    return Scaffold(
      backgroundColor: backColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            VisitingCard(),
            AboutUs(),
            Advantages(),
            DesertCategoriesForPC(),
            FeedbackForPC(),
          ],
        ),
      ),
    );
  }
}
