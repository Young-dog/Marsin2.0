import 'package:flutter/material.dart';

import '../../../res/styles_for_button/styles_for_button.dart';
import '../../../res/styles_for_text/styles_text_for_desctop.dart';

class ButtonForStartWidget extends StatelessWidget {
  const ButtonForStartWidget({Key? key}) : super(key: key);

  final action = 'Выбрать десерт';

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration:  BoxDecoration(
          gradient: gradientForButton,
          borderRadius: const BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          width: 400,
          height: 70,
          alignment: Alignment.center,
          child:  Text(
            action,
            style: styleRegular,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
