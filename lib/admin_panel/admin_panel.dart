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
  String price = "";
  Uint8List? imageFile;
  String? _docId;
  String? imageUrl;
  late final _priceFocusNode;
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  //Получение изображения
  Future<void> getImage() async {
    imageFile = await ImagePickerWeb.getImageAsBytes();
    setState(() {

    });
  }

  //Добавление товара
  void _submit({required Uint8List imageFile}) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    context
        .read<DesertsCubit>()
        .addDesert(name: name!, imageFile: imageFile, price: price!);

    setState(() {
      price = "";
      name = "";
      imageFile = null as Uint8List;
    });
  }

  //Редактирвоание товара
  void _submitEdit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    context
        .read<DesertsCubit>()
        .editDesert(name: name!, id: _docId!, price: price!);

    setState(() {
      price = "";
      name = "";
      imageUrl = null;
    });
  }

  void _submitDel(){
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    context
        .read<DesertsCubit>()
        .delDesert(docId: _docId!);

    setState(() {
      price = "";
      name = "";
      imageUrl = null;
    });
  }

  void editDesert({required String name, required String price, required String imageUrl, required String docId}){
    setState(() {
      this.name = name;
      this.price = price;
      this.imageUrl = imageUrl;
      this._docId = docId;
      _controller.text = name;
      _controller2.text = price;
    });
  }

  @override
  void initState() {
    _priceFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DesertsCubit, DesertsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: backColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state is DesertsAdd ? Text(
                    "Добавление товара",
                    style: bold,
                  ) : Text(
                    "Редактирование товара",
                    style: bold,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: state is DesertsAdd ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              context.read<DesertsCubit>()
                                  .desertPlusOne();
                            });
                          },
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
                          onPressed: () {
                            setState(() {
                              context.read<DesertsCubit>()
                                  .deserEditState();
                            });
                            print(state);
                          },
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
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              context.read<DesertsCubit>()
                                  .desertPlusOne();
                            });
                          },
                          child: Text(
                            "Добавление товара",
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
                        TextButton(
                          onPressed: () {
                            setState(() {
                              context.read<DesertsCubit>()
                                  .deserEditState();
                            });
                            print(state);
                          },
                          child: Text(
                            "Редактирование и удаление товара",
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
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  state is DesertsAdd ?
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
                                    child: Image.memory(imageFile!),
                                  ) :
                                  imageUrl == null ? Container(
                                    width: 352,
                                    height: 287,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                    ),) :
                                  Expanded(
                                    child: Container(
                                      child: Image.network(imageUrl!, width: 330, height: 295,),
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
                                      controller: _controller,
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
                                  //price
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      controller: _controller2,
                                      style: const TextStyle(
                                        color: Color(0xFF3A1C1E),
                                        fontFamily: "IBMPlexSerif",
                                        fontSize: 32,
                                      ),
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
                                  imageUrl != null ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: (){
                                        setState(() {
                                          _submitDel();
                                          _controller.clear();
                                          _controller2.clear();
                                        });
                                      },
                                      child: Text("Удалить", style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "IBMPlexSerif",
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ) : Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    state is DesertsAdd ?
                                    _submit(imageFile: imageFile!) :
                                    _submitEdit();
                                    _controller.clear();
                                    _controller2.clear();
                                  });
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
                                      mainAxisSpacing: 30,
                                      crossAxisSpacing: 60,
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.5,
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

                                      return state is DesertsAdd ? Container(
                                        width: 350,
                                        height: 300,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(child: Image(image: NetworkImage(desrt.imageUrl),)),
                                            Text(
                                              desrt.description,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "IBMPlexSerif",
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
                                                fontFamily: "IBMPlexSerif",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ) : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            editDesert(name: desrt.description, price: desrt.price, imageUrl: desrt.imageUrl, docId: desrt.id);
                                          });
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: Colors.transparent,
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(child: Image(image: NetworkImage(desrt.imageUrl),)),
                                                Text(
                                                  desrt.description,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: "IBMPlexSerif",
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
                                                    fontFamily: "IBMPlexSerif",
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ]),
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
        },
      ),
    );
  }
}
