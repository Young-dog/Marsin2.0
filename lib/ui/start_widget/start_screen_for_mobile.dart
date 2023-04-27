part of 'start_screen_for_pc.dart';

class StartScreenForMobile extends StatefulWidget {
  const StartScreenForMobile({Key? key}) : super(key: key);

  @override
  State<StartScreenForMobile> createState() => _StartScreenForMobileState();
}

class _StartScreenForMobileState extends State<StartScreenForMobile> {
  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        width: wh,
        decoration: BoxDecoration(gradient: backColor),
        child: Column(
          children: [
            //Навигационная панель
            NavBar(),
            //Изображение
            Image.asset(imageFlowerForCard,),
            //Главный текст + кнопка выбора десерта
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Шоколад",
                  style: styleForMainTextMobile,
                  textAlign: TextAlign.center,
                ),
                //SizedBox(height: 15,),
                Text(
                  "ручной работы",
                  style: styleForMainTextMobile,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                Text(
                  "Подарки на любой праздник",
                  style: styleItalicForMobile,
                ),
                const SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: gradientForButton,
                      borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Container(
                      width: 287,
                      height: 54,
                      alignment: Alignment.center,
                      child: Text(
                        'Выбрать десерт',
                        style: styleRegularForMobile,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
