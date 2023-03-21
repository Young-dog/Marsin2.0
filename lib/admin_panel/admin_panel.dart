import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:marsin/bloc/deserts_cubit.dart';
import 'package:marsin/models/desrt.dart';
import 'package:marsin/screens/home_page.dart';
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
    setState(() {});
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
      body: BlocBuilder<DesertsCubit, DesertsState>(
        builder: (context, state) {
          if (state is DesertsInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 20,
              ),
            );
          }
          if (state is DesertsAdd) {
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: backColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Добавление товара",
                      style: bold,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Добавление товара",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 1,
                                  ),
                                ],
                                color: Colors.white,
                                fontSize: 27,
                                fontFamily: "IBMPlexSerif",
                                letterSpacing: 0.07,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Редактирование и удаление товара",
                              style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 1,
                                  ),
                                ],
                                color: Colors.white,
                                fontSize: 27,
                                fontFamily: "IBMPlexSerif",
                                letterSpacing: 0.07,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 1.3,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 5),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  imageFile == null
                                      ? GestureDetector(
                                          onTap: () {
                                            getImage();
                                          },
                                          child: Container(
                                            width: 352,
                                            height: 287,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(70),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Добавить фото",
                                                style: TextStyle(
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      offset: Offset(2, 2),
                                                      blurRadius: 1,
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  fontSize: 27,
                                                  fontFamily: "IBMPlexSerif",
                                                  letterSpacing: 0.07,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(50.0),
                                            child: Image.memory(imageFile!),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    "Описание",
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2, 2),
                                          blurRadius: 1,
                                        ),
                                      ],
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontFamily: "IBMPlexSerif",
                                      letterSpacing: 0.07,
                                    ),
                                  ),
                                  //name
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color: Color(0xFF3A1C1E),
                                        fontFamily: "IBMPlexSerif",
                                        fontSize: 32,
                                      ),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
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
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    "Цена",
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2, 2),
                                          blurRadius: 1,
                                        ),
                                      ],
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontFamily: "IBMPlexSerif",
                                      letterSpacing: 0.07,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color: Color(0xFF3A1C1E),
                                        fontFamily: "IBMPlexSerif",
                                        fontSize: 32,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _submit(imageFile: imageFile!);
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: MediaQuery.of(context).size.height / 1.3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("deserts")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.waiting ||
                                      snapshot.connectionState ==
                                          ConnectionState.none) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.hasError.toString()),
                                    );
                                  }
                                  return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      itemCount:
                                          snapshot.data?.docs.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final QueryDocumentSnapshot doc =
                                            snapshot.data!.docs[index];

                                        final Desert desrt = Desert(
                                          timestamp: doc["timestamp"] ?? 0,
                                          price: doc["price"] ?? "0",
                                          description: doc["name"] ?? "0",
                                          imageUrl: doc["urlImage"] ?? " ",
                                          id: doc["desertId"] ?? "0",
                                        );
                                        print(desrt.imageUrl);

                                        return Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white),
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              alignment:
                                              FractionalOffset
                                                  .topCenter,
                                              image: NetworkImage(
                                                  desrt.imageUrl),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      desrt.description,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily:
                                                            "IBMPlexSerif",
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${desrt.price} руб",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily:
                                                            "IBMPlexSerif",
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(HomePage.id);
                        },
                        child: Text(
                          "Назад",
                          style: TextStyle(
                              fontFamily: "IBMPlexSerif",
                              fontSize: 27,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is DesertsEdit) {}
          return Container();
        },
      ),
    );
  }
}
