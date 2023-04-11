import 'package:flutter/material.dart';
import '../utils/responsiveLayout.dart';
import 'admin_panel_for_pc.dart';

class AdminPanel extends StatelessWidget {
  static const String id = "admin_panel";
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!ResponsiveLayout.isSmallScreen(context) &&
        !ResponsiveLayout.isMediumScreen(context)) {
      return const AdminPanelForPC();
    }
    return const AdminPanelMini();
  }
}
