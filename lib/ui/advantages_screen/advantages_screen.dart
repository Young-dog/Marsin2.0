import 'package:flutter/material.dart';

import '../../utils/responsiveLayout.dart';
import 'advantages_screen_for_pc.dart';

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
