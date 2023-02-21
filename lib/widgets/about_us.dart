import 'package:flutter/material.dart';

import '../links.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
        alignment: Alignment.topLeft,
        child: logo,
      ),

        ],
      ),
    );
  }
}
