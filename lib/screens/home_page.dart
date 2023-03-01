import 'package:flutter/material.dart';
import 'package:marsin/widgets/about_us.dart';
import 'package:marsin/widgets/advantages.dart';
import 'package:marsin/widgets/feedback.dart';
import 'package:marsin/widgets/pc/feedback_for_pc.dart';

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
        backgroundColor: Color(0xFF27011D).withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CardChoco(),
              AboutUs(),
              Advantages(),
              FeedbackForPC(),
            ],
          ),
        ),
      ),
    );
  }
}
