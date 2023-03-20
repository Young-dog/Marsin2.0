import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:marsin/bloc/deserts_cubit.dart';
import '../../utils/links.dart';

class AdminPanel extends StatefulWidget {
  static const String id = "admin_panel";

  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  late String price;
  Uint8List? imageFile;

  late final _priceFocusNode;

  Future<void> getImage() async {
    imageFile = await ImagePickerWeb.getImageAsBytes();

  }

  void _submit({required Uint8List imageFile}) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    context
        .read<DesertsCubit>()
        .addDesert(name: name, imageFile: imageFile, price: price);
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
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DesertsCubit, DesertsState>(
        builder: (context, state) {
          if (state is DesertsInitial) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: backColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<DesertsCubit>().desertPlusOne();
                          },
                          child: Text("Создать товар"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Удалить товар"),
                        ),
                        TextButton(
                          onPressed: () {
                            _submit(imageFile: imageFile!);
                          },
                          child: Text("Добавить товар"),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(45),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is DesertsAdd) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: backColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            imageFile == null
                                ? MaterialButton(
                                    onPressed: () {
                                        setState(() {
                                          getImage();
                                        });
                                    },
                                    child: Text("Добавить изображение"),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(50.0),
                                      child: Image.memory(imageFile!),
                                    ),
                                  ),
                            //name
                            TextFormField(
                              style: const TextStyle(
                                color: Color(0xFF3A1C1E),
                                fontFamily: "IBMPlexSerif",
                                fontSize: 32,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Необходимо ввести название десерта";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                name = value;
                              },
                              onSaved: (value) {
                                name = value!;
                              },
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Color(0xFF3A1C1E),
                                fontFamily: "IBMPlexSerif",
                                fontSize: 32,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Необходимо ввести цену";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                price = value;
                              },
                              onSaved: (value) {
                                price = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Создать товар"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Удалить товар"),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _submit(imageFile: imageFile!);
                              imageFile = null;
                            });
                          },
                          child: Text("Добавить товар"),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(45),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
