import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:marsin/bloc/deserts_cubit.dart';
import 'package:marsin/models/desert_model.dart';
import 'package:marsin/ui/home_page.dart';
import '../../res/styles_for_text/styles_text_for_desctop.dart';
import '../../utils/links.dart';
import '../../utils/styles.dart';
import 'admin_function.dart';

part 'admin_panel_for_mobile.dart';

class AdminPanelForPC extends StatefulWidget {
  static const String id = "admin_panel_for_pc";

  const AdminPanelForPC({Key? key}) : super(key: key);

  @override
  State<AdminPanelForPC> createState() => _AdminPanelForPCState();
}

class _AdminPanelForPCState extends State<AdminPanelForPC> {
  // Получаем изображение с устройства пользователя
  Future<void> getImage() async {
    imageFile = (await ImagePickerWeb.getImageAsBytes())!;
    setState(() {});
  }

  @override
  void initState() {
    //getProducts();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;

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
                  //Заголовок
                  Text(
                    heading,
                    style: styleBold,
                  ),
                  sizedBox,
                  //Выбор режима (добавление/редактирование)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              reset();
                              heading = modes[0];
                              context.read<DesertsCubit>().desertAddState();
                            });
                          },
                          child: heading == modes[0]
                              ? Text(
                                  modes[0],
                                  style: styleForModesY,
                                )
                              : Text(
                                  modes[0],
                                  style: styleForModesN,
                                ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              reset();
                              heading = modes[1];
                              context.read<DesertsCubit>().desertEditState();
                            });
                          },
                          child: heading == modes[1]
                              ? Text(
                                  modes[1],
                                  style: styleForModesY,
                                )
                              : Text(
                                  modes[1],
                                  style: styleForModesN,
                                ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox,
                  //Взаимодествие и отображение товаров
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Добавление или редактирование одного товара
                        Container(
                          width: wh / 4,
                          height: hh / 1.3,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    sizedBox,
                                    //Картинка
                                    state is DesertsAdd
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
                                              child: imageFile == null
                                                  ? Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        "Добавить фото",
                                                        style: styleForModesN,
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        getImage();
                                                      },
                                                      child: Image.memory(
                                                          imageFile!),
                                                    ),
                                            ),
                                          )
                                        : Container(
                                            width: 352,
                                            height: 287,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: imageUrl != null
                                                ? Expanded(
                                                    child: Image(
                                                        image: NetworkImage(
                                                            imageUrl!)))
                                                : Container(),
                                          ),
                                    sizedBox,
                                    //Название
                                    Text(
                                      "Описание",
                                      style: styleForModesN,
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: TextFormField(
                                        controller: controllerName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "IBMPlexSerif",
                                          fontSize: 32,
                                        ),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 2.0),
                                          ),
                                        ),
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(priceFocusNode);
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Необходимо ввести название десерта";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          name = value!;
                                        },
                                      ),
                                    ),
                                    //Цена
                                    Text(
                                      "Цена",
                                      style: styleForModesN,
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: TextFormField(
                                        focusNode: priceFocusNode,
                                        controller: controllerPrice,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "IBMPlexSerif",
                                          fontSize: 32,
                                        ),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 2.0),
                                          ),
                                        ),
                                        textInputAction: TextInputAction.done,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Необходимо ввести цену";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          price = value!;
                                        },
                                      ),
                                    ),
                                    sizedBox,
                                    //Выбор категории либо удаления товара (зависит от режима, в котором работаем)
                                    state is DesertsAdd
                                        ? Column(
                                            children: [
                                              Text(
                                                "Категория",
                                                style: styleForModesN,
                                              ),
                                              SizedBox(
                                                width: 300,
                                                child: DropdownButtonFormField(
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                35),
                                                        borderSide: const BorderSide(
                                                            color: Colors.white,
                                                            width: 2.0),
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                35),
                                                        borderSide: const BorderSide(
                                                            color: Colors.white,
                                                            width: 2.0),
                                                      ),
                                                      filled: true,
                                                    ),
                                                    dropdownColor: Colors.white,
                                                    focusColor: Colors.white,
                                                    iconEnabledColor:
                                                        Colors.white,
                                                    value: dropDownValue,
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropDownValue =
                                                            newValue!;
                                                      });
                                                    },
                                                    items: dropdownItems),
                                              ),
                                              sizedBox,

                                            ],
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(right: 20),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: imageUrl != null
                                                  ? TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          delDesert(context);
                                                        });
                                                      },
                                                      child: Text(
                                                        "Удалить",
                                                        style: styleForField,
                                                      ),
                                                    )
                                                  : Container(),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Кнопка Добавление товара
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    state is DesertsAdd
                                        ? submit(imageFile: imageFile!, context: context)
                                        : submitEdit(context);
                                  });
                                },
                                icon: const Icon(Icons.add))
                          ],
                        ),
                        Container(
                            width: wh / 1.7,
                            height: hh / 1.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              reset();
                                              type = types[0];
                                            });
                                          },
                                          child: type == types[0]
                                              ? Text(
                                                  types[0],
                                                  style: styleForModesY,
                                                )
                                              : Text(
                                                  types[0],
                                                  style: styleForModesN,
                                                ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              reset();
                                              type = types[1];
                                            });
                                          },
                                          child: type == types[1]
                                              ? Text(
                                                  types[1],
                                                  style: styleForModesY,
                                                )
                                              : Text(
                                                  types[1],
                                                  style: styleForModesN,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection("deserts").where("category", isEqualTo: type)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                    int countCurlySets = 0;
                                    int countBouquets = 0;
                                    int len = snapshot.data!.docs.length;

                                    //Считаем кол-во товаров разных категорий
                                    for (int i = 0; i < len; i++) {
                                      if (snapshot.data!.docs[i]["category"] ==
                                          types[0]) {
                                        countCurlySets++;
                                      } else {
                                        countBouquets++;
                                      }
                                    }
                                    //Ожидание
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting ||
                                        snapshot.connectionState ==
                                            ConnectionState.none) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      );
                                    }

                                    //Ошибка
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text(snapshot.hasError.toString()),
                                      );
                                    }

                                    return SizedBox(
                                        width: wh / 1.8,
                                        height: hh /1.4,
                                        child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 30,
                                              crossAxisSpacing: 60,
                                              crossAxisCount: 2,
                                              childAspectRatio: 1.5,
                                            ),
                                            itemCount: type == types[0]
                                                ? countCurlySets
                                                : countBouquets,
                                            itemBuilder: (context, index) {

                                              final QueryDocumentSnapshot doc =
                                              snapshot.data!.docs[index];
                                              final Desert desert = Desert(
                                                timestamp: doc["timestamp"] ?? "",
                                                price: doc["price"] ?? "0",
                                                name: doc["name"] ?? "",
                                                imageUrl: doc["urlImage"] ?? "",
                                                id: doc["desertId"] ?? "",
                                                category: doc["category"] ?? "",
                                              );
                                                return state is DesertsAdd ? SizedBox(
                                                  width: 350,
                                                  height: 300,
                                                  child: Card(
                                                    elevation: 0,
                                                    color: Colors.transparent,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Expanded(
                                                            child: Image(
                                                              image: NetworkImage(
                                                                  desert
                                                                      .imageUrl),
                                                            ),
                                                          ),
                                                          Text(
                                                            desert.name,
                                                            style: styleForField,
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${desert.price} руб",
                                                            style: styleForField,
                                                          ),
                                                        ]),
                                                  ),
                                                ) :  GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      editDesert(
                                                          name: desert.name,
                                                          price: desert.price,
                                                          imageUrl: desert.imageUrl,
                                                          docId: desert.id);
                                                      setState(() {
                                                        imageUrl = desert.imageUrl;
                                                      });
                                                    });
                                                  },
                                                  child: Card(
                                                    elevation: 0,
                                                    color: Colors.transparent,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Expanded(
                                                            child: Image(
                                                              image: NetworkImage(
                                                                  desert
                                                                      .imageUrl),
                                                            ),
                                                          ),
                                                          Text(
                                                            desert.name,
                                                            style: styleForField,
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${desert.price} руб",
                                                            style: styleForField,
                                                          ),
                                                        ]),
                                                  ),
                                                );

                                            }));
                                  })
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  sizedBox,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(HomePage.id);
                      },
                      child: Text(
                        "Назад",
                        style: styleForModesN,
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
