import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:marsin/bloc/deserts_cubit.dart';
import 'package:marsin/models/desert_model.dart';
import '../../utils/links.dart';
import '../screens/home_page.dart';

class ProductsEdit extends StatefulWidget {
  static const String id = "add_and_edit_products";

  const ProductsEdit({Key? key}) : super(key: key);

  @override
  State<ProductsEdit> createState() => _ProductsEditState();
}

class _ProductsEditState extends State<ProductsEdit> {
  final _formKey = GlobalKey<FormState>();

  String _heading = "Добавление товара";
  final List<String> _modes = ["Добавление товара", "Редактирование и удаление товара"];
  String _type = "Фигурные наборы";
  final List<String> _types = ["Фигурные наборы", "Букеты"];
  String _dropDownValue = "Фигурные наборы";
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Букеты"),value: "Букеты"),
      DropdownMenuItem(child: Text("Фигурные наборы"),value: "Фигурные наборы"),
    ];
    return menuItems;
  }


  String? _docId;
  String? _name;
  String? _price;
  String? _imageUrl;
  Uint8List? _imageFile;

  late final _priceFocusNode;
  final _controllerName = TextEditingController();
  final _controllerPrice = TextEditingController();

  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("deserts");
  var _deserts;

  // Получаем товары из БД
  Future<void> getProducts() async {
    QuerySnapshot querySnapshot = await _collectionReference.get();
    _deserts = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(_deserts);
  }

  // Получаем изображение с устройства пользователя
  Future<void> getImage() async {
    _imageFile = (await ImagePickerWeb.getImageAsBytes())!;
    setState(() {
    });
  }

  //Сброс значений
  void _reset() {
    _name = null;
    _price = null;
    _imageUrl = null;
    _imageFile = null;
    _controllerName.clear();
    _controllerPrice.clear();
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
        .addDesert(name: _name!, imageFile: imageFile, price: _price!, category: _dropDownValue);

    setState(() {
      _reset();
    });
  }

  //Сохранение отредактированных полей в firebase
  void _submitEdit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    context
        .read<DesertsCubit>()
        .editDesert(name: _name!, id: _docId!, price: _price!);

    setState(() {
      _reset();
    });
  }

  //Редактирование товара
  void _editDesert({required String name, required String price, required String imageUrl, required String docId}){
    setState(() {
      this._name = name;
      this._price = price;
      this._imageUrl = imageUrl;
      _docId = docId;
      _controllerName.text = name;
      _controllerPrice.text = price;
    });
  }

  //Удаление товара
  void _delDesert(){
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    context
        .read<DesertsCubit>()
        .delDesert(docId: _docId!);

    _reset();
  }


  @override
  void initState() {
    _priceFocusNode = FocusNode();
    getProducts();
    super.initState();
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;

    return Material(
      child: BlocBuilder<DesertsCubit, DesertsState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: backColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Заголовок
                Text(
                  _heading,
                  style: bold,
                ),
                sizedBox,
                //Выбор режима (добавление/редактирование)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){
                        setState(() {
                          _reset();
                          _heading = _modes[1];
                          context.read<DesertsCubit>()
                              .desertAddState();
                        });
                      }, child: _heading == _modes[1] ? Text(_modes[1], style: styleForModesY,) : Text(_modes[1], style: styleForModesN,),),
                      TextButton(onPressed: (){
                        setState(() {
                          _reset();
                          _heading = _modes[2];
                          context.read<DesertsCubit>()
                              .desertEditState();
                        });
                      }, child: _heading == _modes[2] ? Text(_modes[2], style: styleForModesY,) : Text(_modes[2], style: styleForModesN,),),
                    ],
                  ),
                ),
                sizedBox,
                //Взаимодествие и отображение товаров
                Padding(padding: EdgeInsets.symmetric(horizontal: 60), child: Row(
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
                        padding: EdgeInsets.all(3),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                sizedBox,
                                //Картинка
                                state is DesertsAdd ?
                                GestureDetector(
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
                                    child: _imageFile == null ? Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Добавить фото",
                                        style: styleForModesN,
                                      ),
                                    ) : GestureDetector(
                                      onTap: () {
                                        getImage();
                                      },
                                      child: Container(
                                        child: Image.memory(_imageFile!),
                                      ),
                                  ),
                                ),) : Container(
                                  width: 352,
                                  height: 287,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: _imageUrl != null ? Expanded(child: Image(image: NetworkImage(_imageUrl!))) : Container(),
                                ),
                                sizedBox,
                                //Название
                              Text(
                                "Описание",
                                style: styleForModesN,),
                                SizedBox(
                                  width: 400,
                                  child: TextFormField(
                                    controller: _controllerName,
                                    style: const TextStyle(
                                      color: Colors.white,
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
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context).requestFocus(_priceFocusNode);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Необходимо ввести название десерта";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _name = value!;
                                    },
                                  ),
                                ),
                                //Цена
                                Text(
                                  "Цена",
                                  style: styleForModesN,),
                                SizedBox(
                                  width: 400,
                                  child: TextFormField(
                                    focusNode: _priceFocusNode,
                                    controller: _controllerPrice,
                                    style: const TextStyle(
                                      color: Colors.white,
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
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Необходимо ввести цену";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _price = value!;
                                    },
                                  ),
                                ),
                                sizedBox,
                                //Выбор категории либо удаления товара (зависит от режима, в котором работаем)
                                state is DesertsAdd ?
                                Column(
                                  children: [
                                    Text(
                                      "Категория",
                                      style: styleForModesN,
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(35),
                                              borderSide: BorderSide(
                                                  color: Colors.white, width: 2.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(35),
                                              borderSide: BorderSide(
                                                  color: Colors.white, width: 2.0),
                                            ),
                                            filled: true,
                                          ),
                                          dropdownColor: Colors.white,
                                          focusColor: Colors.white,
                                          iconEnabledColor: Colors.white,
                                          value: _dropDownValue,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _dropDownValue = newValue!;
                                            });
                                          },
                                          items: dropdownItems),
                                    ),
                                   sizedBox,
                                  ],
                                ) : Padding(padding: const EdgeInsets.only(right: 20), child: Align(
                                  alignment: Alignment.bottomRight, child: _imageUrl != null ? TextButton(onPressed: () {
                                    setState(() {
                                      _delDesert();
                                    });
                                }, child: const Text("Удалить", style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "IBMPlexSerif",
                                  color: Colors.white,
                                ),),) : Container(),
                                ),),
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
                                state is DesertsAdd ?
                                _submit(imageFile: _imageFile!) :
                                _submitEdit();
                              });
                            },
                            icon: Icon(Icons.add))
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
                        child: Column(
                          children: [
                            Row(children: [
                              TextButton(onPressed: (){
                                setState(() {
                                  _reset();
                                  _type = _types[1];
                                });
                              }, child: _type == _types[1] ? Text(_types[1], style: styleForModesY,) : Text(_types[1], style: styleForModesN,),),
                              TextButton(onPressed: (){
                                setState(() {
                                  _reset();
                                  _type = _types[2];
                                });
                              }, child: _type == _types[2] ? Text(_types[2], style: styleForModesY,) : Text(_types[2], style: styleForModesN,),),
                            ],),
                            StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
                              int countCurlySets = 0;
                              int countBouquets = 0;
                              int len = snapshot.data!.docs.length ?? 0;

                              //Считаем кол-во товаров разных категорий
                              for (int i=0; i<len; i++) {
                                if(snapshot.data!.docs[i]["category"] == _types[1]){
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
                                return Center(
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

                              return Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 30,
                                crossAxisSpacing: 60,
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,), itemCount: _type == _types[1] ? countCurlySets : countBouquets, itemBuilder: (context, index){
                                final QueryDocumentSnapshot doc =
                                snapshot.data!.docs[index];

                                final Desert desert = Desert(
                                  timestamp: doc["timestamp"] ??
                                      "",
                                  price: doc["price"] ?? "0",
                                  name: doc["name"] ?? "",
                                  imageUrl: doc["urlImage"] ?? "",
                                  id: doc["desertId"] ?? "",
                                  category: doc["category"],
                                );

                                if (state is DesertsAdd ) {
                                  if (desert.category == _type) {
                                    return Container(
                                      width: 350,
                                      height: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize
                                            .min,
                                        children: [
                                          Expanded(
                                            child: Image(
                                              image: NetworkImage(
                                                  desert
                                                      .imageUrl),),
                                          ),

                                          Text(
                                            desert.name,
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
                                            "${desert.price} руб",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "IBMPlexSerif",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }

                                if (state is DesertsEdit) {
                                  if (_type == desert.category ) {
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _editDesert(name: desert
                                              .name,
                                              price: desert.price,
                                              imageUrl: desert
                                                  .imageUrl,
                                              docId: desert.id);
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
                                            mainAxisSize: MainAxisSize
                                                .min,
                                            children: [
                                              Expanded(
                                                child: Image(
                                                  image: NetworkImage(
                                                      desert
                                                          .imageUrl),),
                                              ),
                                              Text(
                                                desert.name,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "IBMPlexSerif",
                                                  color: Colors
                                                      .white,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${desert
                                                    .price} руб",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "IBMPlexSerif",
                                                  color: Colors
                                                      .white,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    );
                                  }
                                }
                              }));

                            })
                          ],
                        )
                    )
                  ],
                ),),
                sizedBox,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.id);
                    },
                    child: Text(
                      "Назад",
                      style: styleForModesN,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
