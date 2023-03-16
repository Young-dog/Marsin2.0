import 'package:flutter/material.dart';
import 'package:marsin/widget_for_pc/about_us.dart';
import 'package:marsin/widget_for_pc/advantages.dart';
import 'package:marsin/widget_for_pc/deserts.dart';
import 'package:marsin/widget_for_pc/feedback_for_pc.dart';
import 'package:marsin/widget_for_pc/visiting_card_for_pc.dart';

import '../utils/links.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    return ListView(
      scrollDirection: Axis.vertical,
      controller:  _controller,
      children: [
        VisitingCard(),
        AboutUs(),
        Advantages(),
        DesertForPc(),
        FeedbackForPC(),
      ],
    );
  }
}
