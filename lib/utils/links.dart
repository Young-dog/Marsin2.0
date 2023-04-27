import 'package:flutter/material.dart';

String imageFlowerForCard = "images/ChocoForStart.png";
String chocoAboutUs = "images/ChocoAboutUs.png";
final Gradient backColor = LinearGradient(
  colors: [
    firstColor,
    secondColor,
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const TextStyle styleForCard = TextStyle(
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2, 2),
      blurRadius: 1,
    ),
  ],
  color: Colors.white,
  fontSize: 100,
  fontFamily: "IBMPlexSerifBoldItalic",
  letterSpacing: 0.07,
);

TextStyle styleForModesY = TextStyle(
  decoration: TextDecoration.underline,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2, 2),
      blurRadius: 1,
    ),
  ],
  color: Colors.white,
  fontSize: 27,
  fontFamily: "IBMPlexSerif",
  letterSpacing: 0.07,
);

TextStyle styleForModesN = TextStyle(
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2, 2),
      blurRadius: 1,
    ),
  ],
  color: Colors.white,
  fontSize: 27,
  fontFamily: "IBMPlexSerif",
  letterSpacing: 0.07,
);

TextStyle styleForField = TextStyle(
fontSize: 20,
fontFamily:
"IBMPlexSerif",
color: Colors.white,
);

SizedBox sizedBox = SizedBox(
  height: 35,
);

SizedBox sizedBoxForMobile = SizedBox(
  height: 25,
);

Color firstColor = Color(0xFF4E093A).withOpacity(0.9);
Color secondColor = Color(0xFF060606).withOpacity(0.9);

