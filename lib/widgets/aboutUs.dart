import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset("images/flowersForAboutUs.png"),
          Padding(
            padding: const EdgeInsets.only(top: 150, right: 500),
            child: Column(
              children: const <Widget>[
                Text("О нас",  style: TextStyle(
                  color: Color(0xFF3A1C1E),
                  fontSize: 50,
                  fontFamily: "IBMPlexSansBold",
                ),),
              ],
            ),
          ),
        ],
    ),
    );
  }
}
