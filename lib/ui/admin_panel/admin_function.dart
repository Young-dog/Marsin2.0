import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/deserts_cubit.dart';

final formKey = GlobalKey<FormState>();

ScrollController scrollController = ScrollController();

String heading = "Добавление товара";
final List<String> modes = [
  "Добавление товара",
  "Редактирование и удаление товара"
];
String type = "Фигурные наборы";
final List<String> types = ["Фигурные наборы", "Букеты"];
String dropDownValue = "Фигурные наборы";

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Букеты", child: Text("Букеты")),
    const DropdownMenuItem(
        value: "Фигурные наборы",
        child: Text("Фигурные наборы")),
  ];
  return menuItems;
}

final priceFocusNode = FocusNode();
final controllerName = TextEditingController();
final controllerPrice = TextEditingController();

String? docId;
String? name;
String? price;
String? imageUrl;
Uint8List? imageFile;

//Сброс значений
void reset() {
  name = null;
  price = null;
  imageUrl = null;
  imageFile = null;
  controllerName.clear();
  controllerPrice.clear();
}

//Добавление товара
void submit({required Uint8List imageFile, required BuildContext context}) {
  FocusScope.of(context).unfocus();

  if (!formKey.currentState!.validate()) {
    //Invalid
    return;
  }

  formKey.currentState!.save();

  context.read<DesertsCubit>().addDesert(
      name: name!,
      imageFile: imageFile,
      price: price!,
      category: dropDownValue);

  reset();
}

//Сохранение отредактированных полей в firebase
void submitEdit(BuildContext context) {
  FocusScope.of(context).unfocus();

  if (!formKey.currentState!.validate()) {
    //Invalid
    return;
  }

  formKey.currentState!.save();

  context
      .read<DesertsCubit>()
      .editDesert(name: name!, id: docId!, price: price!);

  reset();
}

//Редактирование товара
void editDesert(
    {required String name,
      required String price,
      required String imageUrl,
      required String docId}) {
  name = name;
  price = price;
  imageUrl = imageUrl;
  docId = docId;
  controllerName.text = name;
  controllerPrice.text = price;
  print(imageUrl);
}

//Удаление товара
void delDesert(BuildContext context) {
  FocusScope.of(context).unfocus();

  if (!formKey.currentState!.validate()) {
    //Invalid
    return;
  }

  formKey.currentState!.save();

  context.read<DesertsCubit>().delDesert(docId: docId!);
  reset();
}

