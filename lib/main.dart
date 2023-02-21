import 'package:flutter/material.dart';
import 'package:marsin/screens/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          theme: ThemeData(
            textTheme:
                Theme.of(context).textTheme.apply(fontFamily: "IBMPlexSerif"),
          ),
          home: const HomePage(),
          navigatorKey: navigatorKey,
          routes: {
            HomePage.id: (context) => const HomePage(),
          },
        );
      },
    );
  }
}
