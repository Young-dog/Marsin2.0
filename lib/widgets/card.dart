import 'package:flutter/material.dart';
import 'package:marsin/widgets/navigation_bar.dart';
import 'package:marsin/widgets/pc/feedback_for_pc.dart';
import 'package:sizer/sizer.dart';

import '../links.dart';

class CardChoco extends StatelessWidget {
  const CardChoco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            child: NavBar(),
          ),
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
                    style: boldItalic,
                    textAlign: TextAlign.center,
                  ),
                  //SizedBox(height: 15,),
                  const Text(
                    "ручной работы",
                    style: boldItalic,
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
          FractionallySizedBox(
            alignment: Alignment.topRight,
            widthFactor: .4,
            child: Image.asset(imageFlowerForCard),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomRight,
            heightFactor: .1 *0.8,
            widthFactor: .2,
            child: Text(
              "Сделано с любовью",
              style: italic
            ),
          )
        ],
      ),
    );
  }
}
