import 'dart:collection';

import 'package:flutter/material.dart';

import '../../utils/links.dart';
import '../../utils/styles.dart';
part 'advantages_for_mobile.dart';

class Advantages extends StatelessWidget {
  const Advantages({Key? key}) : super(key: key);

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
            FractionallySizedBox(
              heightFactor: .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Преимущества",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      letterSpacing: 0.7,
                      fontFamily: "IBMPlexSerifBold",
                    ),
                  )
                ],
              ),
            ),
            FractionallySizedBox(
              heightFactor: 1,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: wh / 4,
                    height: hh * 0.75,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("01", style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          letterSpacing: 0.7,
                          fontFamily: "IBMPlexSerifBold",
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                  Container(
                    width: wh / 4,
                    height: hh * 0.75,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("02", style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          letterSpacing: 0.7,
                          fontFamily: "IBMPlexSerifBold",
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                  Container(
                    width: wh / 4,
                    height: hh * 0.75,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("03", style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          letterSpacing: 0.7,
                          fontFamily: "IBMPlexSerifBold",
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
