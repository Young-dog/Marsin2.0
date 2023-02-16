import 'package:flutter/material.dart';
import 'package:marsin/blocks/appbar.dart';

class Basket extends StatefulWidget {
  static const String id = "basket";
  const Basket({Key? key}) : super(key: key);

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(),
    );
  }
}
