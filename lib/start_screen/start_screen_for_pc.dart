import 'package:flutter/material.dart';
import 'package:marsin/utils/links.dart';
import 'package:marsin/utils/styles.dart';

import '../navigation_bar/navigation_bar.dart';

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
        decoration: BoxDecoration(
            gradient: backColor
        ),
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
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Шоколад",
                    style: styleForCard,

                    textAlign: TextAlign.center,
                  ),
                  //SizedBox(height: 15,),
                  const Text(
                    "ручной работы",
                    style: styleForCard,
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Подарки на любой праздник",
                    style: italic,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration:  BoxDecoration(
                        gradient: gradientForButton,
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        width: 400,
                        height: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          'Выбрать десерт',
                          style: regular,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Image flower
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(imageFlowerForCard,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
