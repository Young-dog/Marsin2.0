import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;
part 'deserts_state.dart';

class DesertsCubit extends Cubit<DesertsState> {
  DesertsCubit() : super(DesertsAdd());

  Future<void> addDesert({required String name, required Uint8List imageFile, required String price}) async {
    late String imageUrl;
    print("Имя - $name\nЦена - $price\n фото - $imageFile");
    if (name.trim().isNotEmpty) {
      //1. write image to storage
      fires.FirebaseStorage storage =
          fires.FirebaseStorage.instance; // Создание экземпляра

      //Загружаем файл, получаем ссылку
      await storage
          .ref("images/${UniqueKey().toString()}.png")
          .putData(imageFile)
          .then((taskSnapshot) async {
        imageUrl = await taskSnapshot.ref.getDownloadURL();
      });
    }

    FirebaseFirestore.instance.collection("deserts").add({
      "timestamp": Timestamp.now(),
      "urlImage": imageUrl,
      "name": name,
      "price": price,
    }).then((docRef) => docRef.update({"desertId": docRef.id}));

    print(imageUrl);

    emit(DesertsAdd());
  }

  Future<void> editDesert({required String id, required String name, required String price}) async{
    await FirebaseFirestore.instance.collection("deserts").doc(id).update({
      "timestamp": Timestamp.now(),
      "name": name,
      "price": price,
    });
  }

  Future<void> delDesert({required String docId}) async{
    await FirebaseFirestore.instance.collection("deserts").doc(docId).delete();
  }

  void desertPlusOne() {
    emit(DesertsAdd());
  }

  void deserEditState() {
    emit(DesertsEdit());
  }

}