import 'package:flutter/material.dart';
import 'package:marsin/widgets/navigation_bar.dart';
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
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 70,
                      fontFamily: "IBMPlexSerifBoldItalic",
                      letterSpacing: 0.07,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //SizedBox(height: 15,),
                  const Text(
                    "ручной работы",
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 70,
                      fontFamily: "IBMPlexSerifBoldItalic",
                      letterSpacing: 0.07,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Подарки на любой праздник",
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: "IBMPlexSerifItalic",
                      letterSpacing: 0.07,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),

                  MaterialButton(

                    onPressed: (){},
                    child: Ink(
                      width: 400,
                      height: 100,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xFFFBF1B39),
                            Color(0xFFD13434),
                          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Выбрать десерт",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 40,
                            fontFamily: "IBMPlexSerif",
                          ),
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
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 1,
                  ),
                ],
                color: Colors.white,
                fontSize: 6.sp,
                fontFamily: "IBMPlexSerifItalic",
              ),
            ),
          )
        ],
      ),
    );
  }
}
