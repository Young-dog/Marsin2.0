import 'package:flutter/material.dart';
import '../utils/links.dart';
import '../utils/styles.dart';

part 'about_us_screen_for_mobile.dart';

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
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset(chocoAboutUs),
                ],
              ),
            ),
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
