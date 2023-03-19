import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:marsin/screens/home_page.dart';
import 'package:marsin/widget_for_pc/admin_panel.dart';

import '../utils/links.dart';

class DesertForPc extends StatefulWidget {
  const DesertForPc({Key? key}) : super(key: key);

  @override
  State<DesertForPc> createState() => _DesertForPcState();
}

class _DesertForPcState extends State<DesertForPc> {
  Uint8List? _imageFile;

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
                Container(
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
                      Text(
                        "Категории десертиков",
                        style: bold,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 80,
                        icon: Icon(Icons.keyboard_arrow_left),
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
                        icon: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            adminPanelActive == true ? Align(
              alignment: Alignment.center,
              child: AlertDialog(
                title: Text("AlertDialog"),
                content: Text(
                    "Would you like to continue learning how to use Flutter alerts?"),
                actions: [
                  TextField(
                    onChanged: (value) {
                      passwd = value;
                    },
                  ),
                  TextButton(
                    child: Text("Continue"),
                    onPressed: () {
                      if (controlPass(passwd)) {
                        Navigator.of(context).pushNamed(AdminPanel.id);
                      }
                    },
                  ),
                ],
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
