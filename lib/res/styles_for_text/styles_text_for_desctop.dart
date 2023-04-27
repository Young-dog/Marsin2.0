import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final styleForTextInStartWidgetBoldItalic = GoogleFonts.ibmPlexSerif(
  textStyle: const TextStyle(
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2, 2),
        blurRadius: 1,
      ),
    ],
    color: Colors.white,
    fontSize: 70,
    letterSpacing: 0.07,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
  ),
);

final styleItalic = GoogleFonts.ibmPlexSerif(
  textStyle: const TextStyle(
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2, 2),
        blurRadius: 1,
      ),
    ],
    color: Colors.white,
    fontSize: 32,
    fontStyle: FontStyle.italic,
    letterSpacing: 0.07,
    fontWeight: FontWeight.w300,
  ),
);

final styleRegular = GoogleFonts.ibmPlexSerif(
  textStyle: const TextStyle(
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2, 2),
        blurRadius: 1,
      ),
    ],
    color: Colors.white,
    fontSize: 32,
    letterSpacing: 0.07,
    fontWeight: FontWeight.w400
  ),
);

final styleBold = GoogleFonts.ibmPlexSerif(
  textStyle: const TextStyle(
      shadows: <Shadow>[
        Shadow(
          offset: Offset(2, 2),
          blurRadius: 1,
        ),
      ],
      color: Colors.white,
      fontSize: 40,
      letterSpacing: 0.07,
      fontWeight: FontWeight.w700
  ),
);