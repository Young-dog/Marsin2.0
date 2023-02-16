import 'package:flutter/material.dart';

import '../blocks/appbar.dart';

class Shop extends StatefulWidget {
  static const String id = "shop";

  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: Container(
          color: Color(0xFF260701),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.all(5.0),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}
