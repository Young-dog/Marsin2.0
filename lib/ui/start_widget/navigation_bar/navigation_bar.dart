import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/links.dart';
import '../../../utils/responsiveLayout.dart';
import 'logo_and_name/logo.dart';
import 'menu/menu.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["О нас", "Каталог", "Контакты", "+7 999 077 20 42"];



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
              child: NavBarMenu(),
            )
          else
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              iconSize: 80,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
