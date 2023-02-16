import 'package:flutter/material.dart';

import '../blocks/appbar.dart';

class Contacts extends StatefulWidget {
  static const String id = "contacts";
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(),
    );
  }
}
