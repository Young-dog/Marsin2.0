import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Stack(
      fit: StackFit.loose,
      children: [
        //candies
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset("images/hare.png"),
        ),
        //form
        Align(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 3.5,
              color: const Color(0xFF6A4F63).withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Не смогли определиться?",
                    style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontSize: 40,
                      fontFamily: "IBMPlexSerifBold",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Оставьте заявку и я  помогу выбрать самый вкусный десерт!",
                    style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontFamily: "IBMPlexSerif",
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const Text(
                    "Имя",
                    style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontFamily: "IBMPlexSerif",
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  //name
                  Container(
                    height: 91,
                    width: 392,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70.0),
                      border: Border.all(width: 1.0),
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
                  const Text(
                    "Телефон",
                    style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontFamily: "IBMPlexSerif",
                      fontSize: 32,
                    ),
                  ),
                  //phone
                  Container(
                    height: 91,
                    width: 392,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70.0),
                      border: Border.all(width: 1.0),
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
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        _submit(context);
                      },
                      child: Container(
                        width: 400,
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFBF1B39),
                                Color(0xFFD13434),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Хочу десерт",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 40,
                            fontFamily: "IBMPlexSerif",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //hare
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset("images/candies.png"),
        )
      ],
    );
  }
}
