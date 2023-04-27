import 'package:flutter/material.dart';

Gradient gradientForButton = LinearGradient(
  colors: [
    colorForButton2,
    colorForButton1,
  ],
  end: Alignment.bottomCenter,
  begin: Alignment.topCenter,
);

Color colorForButton1 = Color(0xFFDA0D00).withOpacity(0.9);
Color colorForButton2 = Color(0xFFE3463C);