import 'package:flutter/material.dart';

import '../../../../res/styles_for_text/styles_text_for_desctop.dart';

var logoAdd =
    'https://firebasestorage.googleapis.com/v0/b/marsin-e4819.appspot.com/o/image_for_site%2Flogo.png?alt=media&token=3c19f3d0-5bbd-491d-895a-63b2352e2e7e';

final logo = Padding(
  padding: const EdgeInsets.only(left: 12),
  child: Column(
    children: [
      SizedBox(
        height: 113,
        width: 114.4,
        child: Image.network(logoAdd),
      ),
      Text(
        "МАРСИН",
        style: styleRegular,
        textAlign: TextAlign.center,
      ),
    ],
  ),
);
