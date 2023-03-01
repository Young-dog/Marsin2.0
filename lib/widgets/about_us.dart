import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../links.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
              child: Image.asset("images/flowersForAboutUs.png"),),
          FractionallySizedBox(
            widthFactor: .5,
            alignment: Alignment.topRight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("О нас", style: TextStyle(
                  color: Colors.white,
                  fontSize: 6.sp,
                  letterSpacing: 0.7,
                  fontFamily: "IBMPlexSerifBold",
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
