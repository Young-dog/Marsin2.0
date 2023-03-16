import 'package:flutter/material.dart';
import '../utils/links.dart';
import 'package:sizer/sizer.dart';

import '../utils/responsiveLayout.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["О нас", "Каталог", "Контакты", "+7 999 077 20 42"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 1,
                  ),
                ],
                fontFamily: "IBMPlexSerif",
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w100),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo,
          if (!ResponsiveLayout.isSmallScreen(context) &&
              !ResponsiveLayout.isMediumScreen(context))
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[...navItem()]),
            )
          else
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
        ],
      ),
    );
  }
}
