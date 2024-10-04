import 'package:flutter/material.dart';
import 'package:blott/src/core/utils/app_const/app_icons.dart';
import 'package:blott/src/features/auth/presentation/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoMainOboardingScreen();
  }

  void gotoMainOboardingScreen() {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppIcons.logoIcon)
            // Container(
            //   width: 400.w,
            //   height: 200.h,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage(AppIcons.logoIcon), fit: BoxFit.cover)),
            // ),
          ],
        ),
      ),
    );
  }
}
