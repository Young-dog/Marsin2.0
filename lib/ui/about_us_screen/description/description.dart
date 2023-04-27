import 'package:flutter/material.dart';

import '../../../res/styles_for_text/styles_text_for_desctop.dart';

class DescriptionForAboutUs extends StatelessWidget {
  const DescriptionForAboutUs({Key? key}) : super(key: key);

  final title = "О нас";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(title, style: styleBold,)
      ],
    );
  }
}
