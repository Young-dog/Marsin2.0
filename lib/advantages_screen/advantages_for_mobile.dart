part of 'advantages_screen_for_pc.dart';

class AdvantagesForMobile extends StatefulWidget {
  const AdvantagesForMobile({Key? key}) : super(key: key);

  @override
  State<AdvantagesForMobile> createState() => _AdvantagesForMobileState();
}

class _AdvantagesForMobileState extends State<AdvantagesForMobile> {
  List<String> advantages = ["", "", ""];

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;
    int i = 0;

    return Material(
      child: Container(
        width: wh,
        decoration: BoxDecoration(gradient: backColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            //Текст
            Text(
              "Преимущества",
              style: styleBoldForMobile,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 110),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: advantages.length,
                  itemBuilder: (context, index) {
                    i++;

                    return Container(
                      width: 250,
                      height: 550,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "0$i",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              letterSpacing: 0.7,
                              fontFamily: "IBMPlexSerifBold",
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
