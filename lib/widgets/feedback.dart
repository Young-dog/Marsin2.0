import 'package:flutter/material.dart';

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";

  dynamic _number = "";

  final FocusNode _numberFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Image.asset("images/boxChoco.png"),
          Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFFFECED),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Не смогли определиться?",
                    style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontSize: 40,
                      fontFamily: "IBMPlexSans",
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Expanded(
                    child: Text(
                      "Оставьте заявку и я  помогу выбрать самый вкусный десерт!",
                      style: TextStyle(
                        color: Color(0xFF3A1C1E),
                        fontSize: 32,
                        fontFamily: "IBMPlexSans",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Имя",
                    style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontSize: 32,
                      fontFamily: "IBMPlexSans",
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45),),
                        borderSide: BorderSide(color: Color(0xFFD13434))
                      )
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(
                          _numberFocusNode); //Переход на поле телефона
                    },
                    onChanged: (value) {
                      _username = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Пожалуйста введите ваше имя";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Телефон",
                    style: TextStyle(
                      color: Color(0xFF3A1C1E),
                      fontSize: 32,
                      fontFamily: "IBMPlexSans",
                    ),
                  ),
                  TextFormField(
                    focusNode: _numberFocusNode,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45),),
                        borderSide: BorderSide(color: Color(0xFFD13434),),
                      )
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      // TODO:- Заявка на заказа в whatsApp
                    },
                    onChanged: (value) {
                      _number = value;
                    },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Пожалуйста введите ваше имя";
                        }
                        return null;
                      },
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    color: const Color(0xFFB12F36),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 48),
                      child: Text(
                        "Хочу десерт",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 40,
                          fontFamily: "IBMPlexSans",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset("images/flower.png"),
        ],
      ),
    );
  }
}
