import 'package:flutter/material.dart';
import 'package:marsin/ui/start_widget/start_screen.dart';
import '../utils/links.dart';
import 'about_us_screen/about_us_screen.dart';
import 'advantages_screen/advantages_screen.dart';
import 'deserts_screen/deserts_screen_for_pc.dart';
import 'feedback_screen/feedback_screen_for_pc.dart';

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
          StartScreen(),
          AboutUsScreen(),
          AdvantagesScreen(),
          DesertForPc(),
          FeedbackForPC(),
        ],
      ),
    );
  }
}
