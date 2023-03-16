import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../utils/links.dart';

class AddDesertScreen extends StatefulWidget {
  static const String id = "screen_add_desert";

  const AddDesertScreen({Key? key}) : super(key: key);

  @override
  State<AddDesertScreen> createState() => _AddDesertScreenState();
}

class _AddDesertScreenState extends State<AddDesertScreen> {
  Uint8List? imageFile;

  Future<dynamic> getImage() async {
    imageFile = await ImagePickerWeb.getImageAsBytes();
    return imageFile;
  }

  Future<void> _submit({required Uint8List image}) async {
    FocusScope.of(context).unfocus();

    if (_description.trim().isNotEmpty) {
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
      "description": _description,
      "price": _price,
    }).then((docRef) => docRef.update({"desertId": docRef.id}));

    Navigator.of(context).pop();
  }

  _unfocus() {
    FocusScope.of(context).unfocus();
  }

  late String _imageUrl;
  String _description = "";
  String _price = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: getImage(),
        builder: (context, snapshot) {
          if (imageFile == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: backColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Image.memory(imageFile!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 700,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(70)
                            ),),
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(180),
                            //Указываем скольско символов можно ввести
                          ],
                          onChanged: (value) {
                            _description = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 700,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(70)
                            ),),
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            _price = value;
                          },
                          onEditingComplete: () {
                            _submit(image: imageFile!);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_imageUrl', _imageUrl));
  }
}
