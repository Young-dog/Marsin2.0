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
Color backColor = Color(0xFF27011D).withOpacity(0.5);

