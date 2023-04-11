import 'package:flutter/material.dart';
import 'package:marsin/advantages_screen/advantages_screen_for_pc.dart';

import '../utils/responsiveLayout.dart';

class AdvantagesScreen extends StatelessWidget {
  const AdvantagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isSmallScreen(context) ) {
      return AdvantagesForMobile();
    }
    if (ResponsiveLayout.isMediumScreen(context)) {
      return const Advantages();
    }
    return const Advantages();
  }
}
