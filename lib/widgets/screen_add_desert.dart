
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AddDesertScreen extends StatefulWidget {
  static const String id = "screen_add_desert";
  const AddDesertScreen({Key? key}) : super(key: key);

  @override
  State<AddDesertScreen> createState() => _AddDesertScreenState();
}

class _AddDesertScreenState extends State<AddDesertScreen> {

  Uint8List? imageFile;

  Future<void> _submit({required Uint8List image}) async{
    FocusScope.of(context).unfocus();

    if (_description.trim().isNotEmpty) {
      //1. write image to storage
      fires.FirebaseStorage storage = fires.FirebaseStorage.instance; // Создание экземпляра

      //Загружаем файл, получаем ссылку
      await storage.ref("images/${UniqueKey().toString()}.png").putData(image).then((taskSnapshot) async {
        _imageUrl = await taskSnapshot.ref.getDownloadURL();
      });
    }

    FirebaseFirestore.instance.collection("deserts").add({
      "timestamp" : Timestamp.now(),
      "urlImage" : _imageUrl,
      "description" : _description,
      "price" : _price,
    }).then((docRef) => docRef.update({"postId" : docRef.id}));

    Navigator.of(context).pop();

  }

  late String _imageUrl;
  String _description = "";
  String _price = "0";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: (){

        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              imageFile == null ? IconButton(onPressed: () async {
                imageFile = await ImagePickerWeb.getImageAsBytes();
              }, icon: Icon(Icons.add)):
             Image.memory(imageFile!),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter a description ",
                ),
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(180), //Указываем скольско символов можно ввести
                ],
                onChanged: (value) {
                  _description = value;
                },

                onEditingComplete: (){
                  _submit(image: imageFile!);
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter a description ",
                ),
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _price = value;
                },

                onEditingComplete: (){
                  _submit(image: imageFile!);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
