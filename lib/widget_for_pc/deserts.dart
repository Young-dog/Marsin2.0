import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:marsin/screens/home_page.dart';

import '../utils/links.dart';

class DesertForPc extends StatefulWidget {
  const DesertForPc({Key? key}) : super(key: key);

  @override
  State<DesertForPc> createState() => _DesertForPcState();
}

class _DesertForPcState extends State<DesertForPc> {
  Uint8List? _imageFile;

  Future<void> getImage() async {
    _imageFile = await ImagePickerWeb.getImageAsBytes();
  }

  Future<void> _submit({required Uint8List image}) async {
    final _formKey = GlobalKey<FormState>();

    FocusScope.of(context).unfocus();

    if (_name.trim().isNotEmpty) {
      //1. write image to storage
      fires.FirebaseStorage storage =
          fires.FirebaseStorage.instance; // Создание экземпляра

      //Загружаем файл, получаем ссылку
      await storage
          .ref("images/${UniqueKey().toString()}.png")
          .putData(image)
          .then((taskSnapshot) async {
        _imageUrl = await taskSnapshot.ref.getDownloadURL();
      });
    }

    FirebaseFirestore.instance.collection("deserts").add({
      "timestamp": Timestamp.now(),
      "urlImage": _imageUrl,
      "description": _name,
      "price": _price,
    }).then((docRef) => docRef.update({"desertId": docRef.id}));
  }

  late String _imageUrl;
  String _name = "";
  double _price = 0;

  bool add = false;

  final _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: backColor),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    mouseCursor: MouseCursor.defer,
                    child: logo,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 3.5,),
                  Text(
                    "Категории десертиков",
                    style: bold,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 80,
                    icon: Icon(Icons.keyboard_arrow_left),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    iconSize: 80,
                    icon: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
