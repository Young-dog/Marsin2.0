import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;

import '../../links.dart';

class AddDesert extends StatefulWidget {
  static const String id = "add_desert";

  const AddDesert({Key? key}) : super(key: key);

  @override
  State<AddDesert> createState() => _AddDesertState();
}

class _AddDesertState extends State<AddDesert> {
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: backColor.withOpacity(0.1),
        ),
      ),
    );
  }
}
