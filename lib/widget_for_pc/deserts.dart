
import 'package:flutter/material.dart';
import 'package:marsin/admin_panel/admin_panel.dart';

import '../utils/links.dart';

class DesertForPc extends StatefulWidget {
  const DesertForPc({Key? key}) : super(key: key);

  @override
  State<DesertForPc> createState() => _DesertForPcState();
}

class _DesertForPcState extends State<DesertForPc> {

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
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 80,
                        icon: const Icon(Icons.keyboard_arrow_left),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        height: 600,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
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
