
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDesertScreen extends StatefulWidget {
  static const String id = "screen_add_desert";
  const AddDesertScreen({Key? key}) : super(key: key);

  @override
  State<AddDesertScreen> createState() => _AddDesertScreenState();
}

class _AddDesertScreenState extends State<AddDesertScreen> {

  Future<void> _submit({required File image}) async{
    FocusScope.of(context).unfocus();

    if (_description.trim().isNotEmpty) {
      //1. write image to storage
      fires.FirebaseStorage storage = fires.FirebaseStorage.instance; // Создание экземпляра

      //Загружаем файл, получаем ссылку
      await storage.ref("images/${UniqueKey().toString()}.png").putFile(image).then((taskSnapshot) async {
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
  double _price = 0;

  @override
  Widget build(BuildContext context) {
    final File imageFile = ModalRoute.of(context)!.settings.arguments as File;

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: (){

        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(imageFile),
                      fit: BoxFit.cover,
                    )
                ),
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.width / 1.4,
              ),
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
                  _submit(image: imageFile);
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter a description ",
                ),
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _price = value as double;
                },

                onEditingComplete: (){
                  _submit(image: imageFile);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
