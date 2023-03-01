import 'package:flutter/material.dart';
import 'package:marsin/links.dart';
import 'package:sizer/sizer.dart';

class Advantages extends StatelessWidget {
  const Advantages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height * 0.75,
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
                      Image.asset("images/cupcake.png"),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height * 0.75,
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
                      Image.asset("images/cake.png"),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height * 0.75,
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
                      Image.asset("images/donut.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            widthFactor: 3.65,
            alignment: Alignment.bottomRight,
            child: Text(
              "МАРСИН - Сделано с любовью",
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
          ),
        ],
      ),
    );
  }
}
