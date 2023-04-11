import 'package:flutter/material.dart';
import 'package:marsin/start_screen/start_screen_for_pc.dart';

import '../utils/responsiveLayout.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isSmallScreen(context) ) {
      return const StartScreenForMobile();
    }
    if (ResponsiveLayout.isMediumScreen(context)) {
      return const StartScreenForPc();
    }
    return const StartScreenForPc();
  }
}
