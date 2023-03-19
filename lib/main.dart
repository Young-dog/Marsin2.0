import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marsin/bloc/deserts_cubit.dart';
import 'package:marsin/widget_for_pc/admin_panel.dart';
import 'utils/firebase_options.dart';
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
        return BlocProvider(
          create: (context) => DesertsCubit(),
          child: MaterialApp(
            theme: ThemeData(
              textTheme:
                  Theme.of(context).textTheme.apply(fontFamily: "IBMPlexSerif"),
            ),
            home: const HomePage(),
            navigatorKey: navigatorKey,
            routes: {
              HomePage.id: (context) => const HomePage(),
              AdminPanel.id: (context) => const AdminPanel(),
            },
          ),
        );
      },
    );
  }
}
