import 'package:flutter/material.dart';

import '../../res/styles_for_text/styles_text_for_desctop.dart';
import '../../utils/links.dart';
import '../../utils/styles.dart';
import 'description/description.dart';
import 'image_about/image_about.dart';

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
          children: const [
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              child: ImageAboutUs(),
            ),
            FractionallySizedBox(
              widthFactor: .5,
              alignment: Alignment.topRight,
              child: DescriptionForAboutUs(),
            )
          ],
        ),
      ),
    );
  }
}
