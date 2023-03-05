import 'package:flutter/material.dart';

dynamic logo = Padding(
  padding: const EdgeInsets.only(left: 12),
  child: Column(
    children: [
      Image.asset(
        "images/cupcake.png",
        width: 114.4,
        height: 114,
      ),
      Text(
        "МАРСИН",
        style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 1,
              ),
            ],
            fontFamily: "IBMPlexSerif",
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w100),
        textAlign: TextAlign.center,
      ),
    ],
  ),
);
String imageFlowerForCard = "images/flowersForCard.png";
final Color backColor = Color(0xFF27011D).withOpacity(0.7);
const Gradient gradientForButton = LinearGradient(
  colors: [Color(0xFFFFFFFF), Color(0xFFBF1B39),],
  end: Alignment.center,
  begin: Alignment.topCenter,
);

const TextStyle bold = TextStyle();
const TextStyle boldItalic = TextStyle(
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2, 2),
      blurRadius: 1,
    ),
  ],
  color: Colors.white,
  fontSize: 70,
  fontFamily: "IBMPlexSerifBoldItalic",
  letterSpacing: 0.07,
);
const TextStyle italic = TextStyle(
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2, 2),
      blurRadius: 1,
    ),
  ],
  color: Colors.white,
  fontSize: 32,
  fontFamily: "IBMPlexSerifItalic",
  letterSpacing: 0.07,
);
const TextStyle regular = TextStyle(
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2, 2),
      blurRadius: 1,
    ),
  ],
  color: Color(0xFFFFFFFF),
  fontSize: 40,
  fontFamily: "IBMPlexSerif",
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
