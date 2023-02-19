import 'package:flutter/material.dart';
import 'package:marsin/widgets/aboutUs.dart';
import 'package:marsin/widgets/feedback.dart';

import '../widgets/card.dart';
import '../widgets/navbar.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";

  dynamic _number = "";

  final FocusNode _numberFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NavBar(),
              CardChoco(),
              AboutUs()
            ],
          ),
        ),
      ),
    );
  }
}
