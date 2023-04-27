part of 'admin_panel_for_pc.dart';

class AdminPanelMini extends StatefulWidget {
  static const String id = "admin_panel_for_mobile";
  const AdminPanelMini({Key? key}) : super(key: key);

  @override
  State<AdminPanelMini> createState() => _AdminPanelMiniState();
}

class _AdminPanelMiniState extends State<AdminPanelMini> {
  final ScrollController _scrollController = ScrollController();
  double i = 0;

  //Скролинг товаров
  void buttonController(bool serf) {
    if (serf == true) {
      i += 380;
    } else {
      i -= 380;
    }
  }

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
          return Container(
            width: wh,
            height: hh,
            decoration: BoxDecoration(
              gradient: backColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Заголовок
                  Text(
                    heading,
                    style: styleBoldForMobile,
                    textAlign: TextAlign.center,
                  ),
                  sizedBoxForMobile,
                  //Изменение режима
                  TextButton(
                    onPressed: () {
                      setState(() {
                        reset();
                        heading == modes[0]
                            ? heading = modes[1]
                            : heading = modes[0];
                        type = heading;
                        heading == modes[1]
                            ? context.read<DesertsCubit>().desertEditState()
                            : context.read<DesertsCubit>().desertAddState();
                      });
                    },
                    child: heading == modes[0]
                        ? Text(
                      modes[1],
                      style: styleForModesInMobile,
                      textAlign: TextAlign.center,
                    )
                        : Text(
                      modes[0],
                      style: styleForModesInMobile,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Окно добавления/редактирования товаров
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      width: wh,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 20,),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              state is DesertsAdd
                                  ? GestureDetector(
                                onTap: () {
                                  getImage();
                                },
                                child: Container(
                                  width: 249,
                                  height: 197,
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
                                width: 249,
                                height: 197,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white),
                                  borderRadius:
                                  BorderRadius.circular(70),
                                ),
                                child: imageUrl != null
                                    ? Expanded(
                                    child: Image(
                                        image: NetworkImage(
                                            imageUrl!)))
                                    : Container(),
                              ),
                              sizedBoxForMobile,
                              //Название
                              Text(
                                "Описание",
                                style: styleForModesN,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: controllerName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "IBMPlexSerif",
                                    fontSize: 20,
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
                                width: 300,
                                child: TextFormField(
                                  focusNode: priceFocusNode,
                                  controller: controllerPrice,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "IBMPlexSerif",
                                    fontSize: 20,
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
                                  sizedBoxForMobile,
                                  TextButton(onPressed: (){

                                  }, child: Text("Добавить", style: styleForModesInMobile,))
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
                  sizedBoxForMobile,
                  //Вывод товаров и выбор категории
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width: wh,
                      child: Column(
                        children: [
                          //Выбор категории
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  style: styleForModesInMobile,
                                )
                                    : Text(
                                  types[0],
                                  style: styleForModesInMobile,
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
                                  style: styleForModesInMobile,
                                )
                                    : Text(
                                  types[1],
                                  style: styleForModesInMobile,
                                ),
                              ),
                            ],
                          ),
                          //Вывод товаров
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: StreamBuilder<QuerySnapshot>(
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: GridView.builder(
                                      controller: _scrollController,
                                      gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200.0,
                                          mainAxisSpacing:20.0,
                                          crossAxisSpacing: 20.0,
                                          childAspectRatio: 1.3
                                      ),
                                      scrollDirection: Axis.horizontal,
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
                                          width: 200,
                                          height: 130,
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
                                                    style: styleForFieldOnMobile,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${desert.price} руб",
                                                    style: styleForFieldOnMobile,
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
                                                    style: styleForFieldOnMobile,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${desert.price} руб",
                                                    style: styleForFieldOnMobile,
                                                  ),
                                                ]),
                                          ),
                                        );

                                      }),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBoxForMobile,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(HomePage.id);
                      },
                      child: Text(
                        "Назад",
                        style: styleForModesInMobile,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}