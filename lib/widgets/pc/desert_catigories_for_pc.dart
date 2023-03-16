import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;

import '../../links.dart';

import 'add_desert.dart';

class DesertCategoriesForPC extends StatefulWidget {
  const DesertCategoriesForPC({Key? key}) : super(key: key);

  @override
  State<DesertCategoriesForPC> createState() => _DesertCategoriesForPCState();
}

class _DesertCategoriesForPCState extends State<DesertCategoriesForPC> {
  double width = 0;
  double height = 0;
  bool isAnnimated = true;

  String _name = "";
  late double _price;
  Uint8List? imageFile;
  late String _imageUrl;

  late final _priceFocusNode;

  Future<void> getImage() async {
    imageFile = await ImagePickerWeb.getImageAsBytes();
  }

  Future<void> _submit({required Uint8List imageFile}) async {
    FocusScope.of(context).unfocus();

    if (_name.trim().isNotEmpty) {
      //1. write image to storage
      fires.FirebaseStorage storage =
          fires.FirebaseStorage.instance; // Создание экземпляра

      //Загружаем файл, получаем ссылку
      await storage
          .ref("images/${UniqueKey().toString()}.png")
          .putData(imageFile)
          .then((taskSnapshot) async {
        _imageUrl = await taskSnapshot.ref.getDownloadURL();
      });
    }
  }

  @override
  void initState() {
    _priceFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Text("Категории"),
          Container(
            width: 5,
            height: 5,
            child: GridView.builder(itemCount: 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ), itemBuilder: (context, index) {
              return Container();
            }),
          ),
          AnimatedContainer(
            width: width,
            height: height,
            color: Colors.yellow,
            duration: Duration(milliseconds: 400),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: FutureBuilder(
                    future: getImage(),
                    builder: (context, snapshot) {
                      return imageFile == null ? MaterialButton(
                        onPressed: () {
                          getImage();
                        },
                        child: Text("Загрузить изображение"),
                      ) : Expanded(
                        child: Image.memory(imageFile!),
                      );

                    },
                  ),
                ),
                Text("Название", style: italic),
                SizedBox(
                  height: 35,
                ),
                //name
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(35))),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onChanged: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Необходимо ввести название десерта!";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 35,
                ),
                //price
                Text("Цена", style: italic),
                TextFormField(
                  focusNode: _priceFocusNode,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(35))),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    _submit(imageFile: imageFile!);
                  },
                  onChanged: (value) {
                    _price = double.parse(value);
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Необходимо ввести цену продукта";
                    }
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Загрузить"),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          TextButton(onPressed: () {
            if (isAnnimated == false) {
              setState(() {
                width = 600;
                height = 800;
              });
            } else {
              setState(() {
                width = 0;
                height = 0;
              });
            }
            isAnnimated = !isAnnimated;
          }, child: Text("Animation"))

        ],
      ),
    );
  }
}
