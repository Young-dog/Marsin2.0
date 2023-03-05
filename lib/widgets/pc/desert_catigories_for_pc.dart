import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marsin/widgets/screen_add_desert.dart';

class DesertCategoriesForPC extends StatefulWidget {
  const DesertCategoriesForPC({Key? key}) : super(key: key);

  @override
  State<DesertCategoriesForPC> createState() => _DesertCategoriesForPCState();
}

class _DesertCategoriesForPCState extends State<DesertCategoriesForPC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Text(""),
          Row(),
          GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 3,
            mainAxisSpacing: 6,
          ), itemBuilder: (context, index) {
            return Container();
          }),
          MaterialButton(onPressed: (){
            final picker = ImagePicker();
            picker
                .pickImage(source: ImageSource.gallery, imageQuality: 40)
                .then((xFile) {
              if (xFile != null) {
                final file = File(xFile.path);
                Navigator.of(context).pushNamed(AddDesertScreen.id,
                    arguments: file); // Передаем файл через arguments
              }
            });
          }, child: Icon(Icons.add),)
        ],
      ),
    );
  }
}
