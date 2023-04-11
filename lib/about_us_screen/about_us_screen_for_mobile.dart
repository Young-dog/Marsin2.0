part of 'about_us_screen_for_pc.dart';

class AboutUsForMobile extends StatelessWidget {
  const AboutUsForMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        width: wh,
        decoration: BoxDecoration(gradient: backColor),
        child: Column(
          children: [
            //Заголовок
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 40.0, right: 80),
              child: Align(alignment: Alignment.topRight,child: Text("О нас", style: styleBoldForMobile,)),
            ),
            //Информация

            //Изображение
            Image.asset(chocoAboutUs),
          ],
        ),
      ),
    );
  }
}
