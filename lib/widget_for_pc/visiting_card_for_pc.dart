import 'package:flutter/material.dart';
import '../utils/links.dart';

import 'navigation_bar.dart';

class VisitingCard extends StatefulWidget {
  const VisitingCard({Key? key}) : super(key: key);

  @override
  State<VisitingCard> createState() => _VisitingCardState();
}

class _VisitingCardState extends State<VisitingCard> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: backColor
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
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
                    height: 100,
                  ),
                  MaterialButton(
                    onPressed: () {
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
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
              alignment: Alignment.topRight,
              widthFactor: .4,
              child: Image.asset(imageFlowerForCard),
            ),
          ],
        ),
      ),
    );
  }
}
