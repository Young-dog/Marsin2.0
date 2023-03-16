import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/links.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
            decoration: BoxDecoration(
                gradient: backColor
            ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              widthFactor: .5,
              alignment: Alignment.topRight,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("О нас", style: bold,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}