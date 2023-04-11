import 'package:flutter/material.dart';
import 'package:marsin/about_us_screen/about_us_screen_for_pc.dart';

import '../utils/responsiveLayout.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isSmallScreen(context)) {
      return const AboutUsForMobile();
    }
    if (ResponsiveLayout.isMediumScreen(context)) {
      return const AboutUs();
    }
    return const AboutUs();
  }
}
