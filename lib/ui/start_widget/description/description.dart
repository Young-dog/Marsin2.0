import 'package:flutter/material.dart';

import '../../../res/styles_for_text/styles_text_for_desctop.dart';

class DescriptionForStart extends StatelessWidget {
  const DescriptionForStart({Key? key}) : super(key: key);

  final textBold = 'Шоколад\nручной работы';
  final textItalic = 'Подарки на любой праздник';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          textBold,
          style: styleForTextInStartWidgetBoldItalic,
          textAlign: TextAlign.center,
        ),
        Text(
          textItalic,
          style: styleItalic,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
