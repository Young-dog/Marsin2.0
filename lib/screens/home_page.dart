import 'package:flutter/material.dart';
import 'package:marsin/widget_for_pc/about_us.dart';
import 'package:marsin/widget_for_pc/advantages.dart';
import 'package:marsin/widget_for_pc/deserts.dart';
import 'package:marsin/widget_for_pc/feedback_for_pc.dart';

import '../utils/links.dart';
import '../widget_for_pc/start_screen_for_pc.dart';

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
    return Container(
      decoration: BoxDecoration(
        gradient: backColor,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        addRepaintBoundaries: false,
        controller:  _controller,
        padding: EdgeInsets.all(0.0),
        children: [
          StartScreenForPc(),
          AboutUs(),
          Advantages(),
          DesertForPc(),
          FeedbackForPC(),
        ],
      ),
    );
  }
}
