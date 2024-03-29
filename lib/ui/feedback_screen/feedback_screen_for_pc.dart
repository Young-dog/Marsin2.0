import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../res/styles_for_button/styles_for_button.dart';
import '../../res/styles_for_text/styles_text_for_desctop.dart';
import '../../utils/links.dart';

class FeedbackForPC extends StatefulWidget {
  static const String id = "feedback_for_pc";

  const FeedbackForPC({Key? key}) : super(key: key);

  @override
  State<FeedbackForPC> createState() => _FeedbackForPCState();
}

class _FeedbackForPCState extends State<FeedbackForPC> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _phoneNumber = "";

  late final FocusNode _phoneNumberFocusNode;

  Future<void> _submit(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    FirebaseFirestore.instance.collection("clientBase").add({
      "name": _name,
      "phone": _phoneNumber,
      "date": Timestamp.now(),
    });
  }

  @override
  void initState() {
    _phoneNumberFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: backColor
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            //form
            Align(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    width: 630,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Text(
                            "Не смогли определиться?",
                            style: styleBold,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                           Text(
                            "Оставьте заявку и я\nпомогу выбрать самый\nвкусный десерт!",
                            style: styleItalic,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                           Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 120),
                              child: Text(
                                "Имя",
                                style: styleRegular,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                          //name
                          Container(
                            height: 91,
                            width: 392,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              border: Border.all(
                                width: 1.0,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Color(0xFF3A1C1E),
                                  fontFamily: "IBMPlexSerif",
                                  fontSize: 32,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_phoneNumberFocusNode);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Пожалуйста введите ваше имя";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  _name = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                           Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 120),
                              child: Text(
                                "Телефон",
                                style: styleRegular,
                              ),
                            ),
                          ),
                          //phone
                          Container(
                            height: 91,
                            width: 392,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              border: Border.all(
                                width: 1.0,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Color(0xFF3A1C1E),
                                  fontFamily: "IBMPlexSerif",
                                  fontSize: 32,
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onFieldSubmitted: (_) {
                                  _submit(context);
                                },
                                validator: (value) {
                                  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                  RegExp regExp = RegExp(patttern);
                                  if (value!.isEmpty) {
                                    return 'Пожалуйста введите ваш номер телефона';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Телефон указан некорректно';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  _phoneNumber = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          MaterialButton(
                            onPressed: () {
                              _submit(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: const EdgeInsets.all(0.0),
                            child: Ink(
                              decoration:  BoxDecoration(
                                gradient: gradientForButton,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80.0)),
                              ),
                              child: Container(
                                width: 400,
                                height: 100,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Хочу десерт',
                                  style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 1,
                                      ),
                                    ],
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 40,
                                    fontFamily: "IBMPlexSerif",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
