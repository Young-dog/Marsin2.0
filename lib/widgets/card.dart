import 'package:flutter/material.dart';

class CardChoco extends StatelessWidget {
  const CardChoco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFFFFECED),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Шоколад\nручной работы",
                      style: TextStyle(
                        color: Color(0xFF3A1C1E),
                        fontSize: 70,
                        fontFamily: "IBMPlexSansBold",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Подарки на любой праздник",
                      style: TextStyle(
                        color: Color(0xFF3A1C1E),
                        fontSize: 32,
                        fontFamily: "IBMPlexSansItalic",
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      color: const Color(0xFFB12F36),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 48),
                        child: Text(
                          "Выбрать десерт",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 40,
                            fontFamily: "IBMPlexSans",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset("images/flowersForCard.png"),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Text(
                "Сделано с любовью",
                style: TextStyle(
                  color: Color(0xFF3A1C1E),
                  fontSize: 32,
                  fontFamily: "IBMPlexSansItalic",
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
