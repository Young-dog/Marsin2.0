import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackScreen extends StatefulWidget {

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  final _formKey = GlobalKey<FormState>();

  String username = "";
  dynamic phone;

  final _phoneFocusNode = FocusNode();

  _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    FirebaseFirestore.instance.collection("data").add({
      "name" : username,
      "phone" : phone
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Container(
                color: Color(0xFF6A4F63).withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Text("  Не смогли определиться?  ", style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontSize: 40,
                      fontFamily: "IBMPlexSerifBold",
                    ),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Text("Оставьте заявку и я\nпомогу выбрать самый\nвкусный десерт!", style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontFamily: "IBMPlexSerif",
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Text("Имя", style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontFamily: "IBMPlexSerif",
                      fontSize: 32,
                    ),
                      textAlign: TextAlign.left),
                    SizedBox(
                      height: 91,
                      width: 392,
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(70)
                            )
                        ),
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_phoneFocusNode);
                        },
                        onChanged: (value) {
                          username = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Пожалуйста введите ваше имя";
                          }
                          return null;
                        },
                      ),
                    ),
                    Text("Телефон", style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontFamily: "IBMPlexSerif",
                      fontSize: 32,
                    ),
                      textAlign: TextAlign.left,),
                    SizedBox(
                      height: 91,
                      width: 392,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(70)
                          )
                        ),
                        focusNode: _phoneFocusNode,
                        onFieldSubmitted: (_) {
                          _submit(context);
                        },
                        onChanged: (value) {
                          phone = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Пожалуйста ведите ваш номер телефона";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    MaterialButton(

                      onPressed: (){
                        _submit(context);
                      },
                      child: Ink(
                        width: 400,
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xFFFBF1B39),
                            Color(0xFFD13434),
                          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Container(
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
          )
        ],
      ),
    );
  }
}
