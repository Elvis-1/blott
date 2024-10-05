import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/providers.dart';
import 'package:blott/src/features/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'package:blott/src/config/service_locators.dart' as service_locator;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.setupLocator();

  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430.0, 812.0),
        builder: (context, child) {
          return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen());
        });
  }
}
