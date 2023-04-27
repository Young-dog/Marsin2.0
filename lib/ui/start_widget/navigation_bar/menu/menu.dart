import 'package:flutter/material.dart';

import '../../../../res/styles_for_text/styles_text_for_desctop.dart';

class NavBarMenu extends StatelessWidget {
  NavBarMenu({Key? key}) : super(key: key);
  final navLinks = ["О нас",  "Преимущества", "Контакты",  "Каталог"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: styleRegular,
            ),
          ),
          const SizedBox(width: 30,)
        ],
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[...navItem()]);
  }
}
