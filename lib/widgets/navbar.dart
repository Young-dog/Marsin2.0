import 'package:flutter/material.dart';
import '../utils/responsiveLayout.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["О нас", "Каталог", "Контакты"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 45),
        child: TextButton(
          onPressed: () {  },
          child: Text(text,
          style: TextStyle(
              fontFamily: "IBMPlexSans",
              fontSize: 32,
              color: Color(0xFF3A1C1E),
              fontWeight: FontWeight.w100),
        ),),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: <Widget>[
              Image.asset("images/cupcake.png"),
              Text(
                "МАРСИН",
                style: TextStyle(
                    fontFamily: "IBMPlexSans",
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
          //Spacer(),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[...navItem()]
            )
          else
            IconButton(onPressed: (){}, icon: Icon(Icons.menu))
        ],
      ),
    );
  }
}
