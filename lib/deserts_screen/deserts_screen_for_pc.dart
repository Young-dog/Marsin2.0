
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marsin/admin_panel/admin_panel_for_pc.dart';

import '../admin_panel/admin_panel.dart';
import '../models/desert_model.dart';
import '../utils/links.dart';

class DesertForPc extends StatefulWidget {
  const DesertForPc({Key? key}) : super(key: key);

  @override
  State<DesertForPc> createState() => _DesertForPcState();
}

class _DesertForPcState extends State<DesertForPc> {
  ScrollController _scrollController = ScrollController();

  double i = 0;

  String _type = "Фигурные наборы";
  final List<String> _types = ["Фигурные наборы", "Букеты"];

  // set up the buttons
  String passwd = "";

  bool adminPanelActive = false;

  bool controlPass(value) {
    bool pass = false;
    if (value == "123456") pass = true;
    return pass;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: backColor),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            adminPanelActive = !adminPanelActive;
                          });
                        },
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        mouseCursor: MouseCursor.defer,
                        child: logo,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.5,
                      ),
                      const Text(
                        "Категории десертиков",
                        style: bold,
                      )
                    ],
                  ),
                ),Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _type = _types[0];
                        });
                      },
                      child: _type == _types[0]
                          ? Text(
                        _types[0],
                        style: styleForModesY,
                      )
                          : Text(
                        _types[0],
                        style: styleForModesN,
                      ),
                    ),
                    SizedBox(width: 300,),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _type = _types[1];
                        });
                      },
                      child: _type == _types[1]
                          ? Text(
                        _types[1],
                        style: styleForModesY,
                      )
                          : Text(
                        _types[1],
                        style: styleForModesN,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          i -= MediaQuery.of(context).size.width;
                          _scrollController.animateTo(i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        iconSize: 80,
                        icon: const Icon(Icons.keyboard_arrow_left),
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width - 200,
                      //   height: 600,
                      //   child: StreamBuilder<QuerySnapshot>(
                      //       stream: FirebaseFirestore.instance
                      //           .collection("deserts").where("category", isEqualTo: _type)
                      //           .snapshots(),
                      //       builder: (context, snapshot) {
                      //         int countCurlySets = 0;
                      //         int countBouquets = 0;
                      //         int len = snapshot.data!.docs.length;
                      //
                      //         //Считаем кол-во товаров разных категорий
                      //         for (int i = 0; i < len; i++) {
                      //           if (snapshot.data!.docs[i]["category"] ==
                      //               _types[0]) {
                      //             countCurlySets++;
                      //           } else {
                      //             countBouquets++;
                      //           }
                      //         }
                      //
                      //         print(countCurlySets);
                      //         print(countBouquets);
                      //
                      //         //Ожидание
                      //         if (snapshot.connectionState ==
                      //             ConnectionState.waiting ||
                      //             snapshot.connectionState ==
                      //                 ConnectionState.none) {
                      //           return Center(
                      //             child: CircularProgressIndicator(
                      //               color: Colors.white,
                      //             ),
                      //           );
                      //         }
                      //
                      //         //Ошибка
                      //         if (snapshot.hasError) {
                      //           return Center(
                      //             child: Text(snapshot.hasError.toString()),
                      //           );
                      //         }
                      //
                      //         return SizedBox(
                      //             child: GridView.builder(
                      //               controller: _scrollController,
                      //                 gridDelegate:
                      //                 const SliverGridDelegateWithFixedCrossAxisCount(
                      //                   mainAxisSpacing: 60,
                      //                   crossAxisSpacing: 30,
                      //                   crossAxisCount: 2,
                      //                   mainAxisExtent: 400
                      //                 ),
                      //                 scrollDirection: Axis.horizontal,
                      //                 itemCount: _type == _types[0]
                      //                     ? countCurlySets
                      //                     : countBouquets,
                      //                 itemBuilder: (context, index) {
                      //
                      //                   final QueryDocumentSnapshot doc =
                      //                   snapshot.data!.docs[index];
                      //                   final Desert desert = Desert(
                      //                     timestamp: doc["timestamp"] ?? "",
                      //                     price: doc["price"] ?? "0",
                      //                     name: doc["name"] ?? "",
                      //                     imageUrl: doc["urlImage"] ?? "",
                      //                     id: doc["desertId"] ?? "",
                      //                     category: doc["category"] ?? "",
                      //                   );
                      //
                      //                   print(_type);
                      //
                      //                   return Container(
                      //                     width: 500,
                      //                     height: 450,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.transparent,
                      //                       child: Column(
                      //                           mainAxisAlignment:
                      //                           MainAxisAlignment.end,
                      //                           crossAxisAlignment:
                      //                           CrossAxisAlignment
                      //                               .center,
                      //                           mainAxisSize:
                      //                           MainAxisSize.min,
                      //                           children: [
                      //                             Expanded(
                      //                               child: Image(
                      //                                 image: NetworkImage(
                      //                                     desert
                      //                                         .imageUrl),
                      //                               ),
                      //                             ),
                      //                             Text(
                      //                               desert.name,
                      //                               style: TextStyle(
                      //                                 fontSize: 20,
                      //                                 fontFamily:
                      //                                 "IBMPlexSerif",
                      //                                 color: Colors.white,
                      //                               ),
                      //                             ),
                      //                             SizedBox(
                      //                               height: 5,
                      //                             ),
                      //                             Text(
                      //                               "${desert.price} руб",
                      //                               style: TextStyle(
                      //                                 fontSize: 20,
                      //                                 fontFamily:
                      //                                 "IBMPlexSerif",
                      //                                 color: Colors.white,
                      //                               ),
                      //                             ),
                      //                             SizedBox(height: 5,),
                      //                             MaterialButton(
                      //                               onPressed: () {
                      //                               },
                      //                               shape: RoundedRectangleBorder(
                      //                                   borderRadius: BorderRadius.circular(80.0)),
                      //                               padding: const EdgeInsets.all(0.0),
                      //                               child: Ink(
                      //                                 decoration:  BoxDecoration(
                      //                                     gradient: gradientForButton,
                      //                                     borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      //
                      //                                 ),
                      //                                 child: Container(
                      //                                   width: 195,
                      //                                   height: 43,
                      //                                   alignment: Alignment.center,
                      //                                   child: const Text(
                      //                                     'Выбрать десерт',
                      //                                     style: TextStyle(
                      //                                       fontSize: 20,
                      //                                       fontFamily:
                      //                                       "IBMPlexSerif",
                      //                                       color: Colors.white,
                      //                                     ),
                      //                                     textAlign: TextAlign.center,
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ]),
                      //                     ),
                      //                   );
                      //                 }));
                      //       }),
                      // ),
                      IconButton(
                        onPressed: () {
                          i += MediaQuery.of(context).size.width;
                          _scrollController.animateTo(i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        iconSize: 80,
                        icon: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            adminPanelActive == true
                ? Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          adminPanelActive = !adminPanelActive;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white.withOpacity(0.1),
                        child: AlertDialog(
                          backgroundColor: const Color(0xFF4B1A3D),
                          title: const Text(
                            "Авторизация",
                            style: bold,
                          ),
                          actions: [
                            TextField(
                              onChanged: (value) {
                                passwd = value;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(70),
                              )),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                child: const Text(
                                  "Войти",
                                  style: TextStyle(
                                      fontFamily: "IBMPlexSerif",
                                      fontSize: 27,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  if (controlPass(passwd)) {
                                    Navigator.of(context).pushReplacementNamed(AdminPanel.id);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
