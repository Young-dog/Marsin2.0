import 'package:flutter/material.dart';
import 'package:marsin/ui/start_widget/start_image/start_image.dart';
import 'package:marsin/utils/links.dart';
import 'package:marsin/utils/styles.dart';

import '../../res/styles_for_button/styles_for_button.dart';
import 'button/button.dart';
import 'description/description.dart';
import 'navigation_bar/navigation_bar.dart';

part 'start_screen_for_mobile.dart';

class StartScreenForPc extends StatefulWidget {
  const StartScreenForPc({Key? key}) : super(key: key);

  @override
  State<StartScreenForPc> createState() => _StartScreenForPcState();
}

class _StartScreenForPcState extends State<StartScreenForPc> {
  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        decoration: BoxDecoration(gradient: backColor),
        width: wh,
        height: hh,
        child: Stack(
          children: [
            //navigationBAr
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              child: NavBar(),
            ),
            //Text and Button
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              heightFactor: .9,
              widthFactor: .6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  DescriptionForStart(),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonForStartWidget(),
                ],
              ),
            ),
            //Image flower
            const FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 1,
              child: StartImageForWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
