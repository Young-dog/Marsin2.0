import 'package:firebase_core/firebase_core.dart';
import 'package:marsin/widgets/pc/add_desert.dart';
import 'package:marsin/widgets/screen_add_desert.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:marsin/screens/home_page.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            AddDesert.id: (context) => const AddDesert(),
          },
        );
      },
    );
  }
}
