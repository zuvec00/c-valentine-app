import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/main_screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  bool isBeforeValentine() {
    DateTime today = DateTime.now();
    DateTime targetDate = DateTime(2025, 2, 14); //  Valentine's Day 2025

    if (today.isBefore(targetDate)) {
      if (kDebugMode) {
        print("🎵 Music will not play until February 14, 2025.");
      }
      return true; //  Exit the function if today is before the target date
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return isBeforeValentine()
        ? const Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You had to open the app ba 🤣?\n Don\'t worry I accounted for that. Wait until Valentine Day werey.',
                  textAlign: TextAlign.center,
                  // style: TextStyle(fontFamily: 'PlayfairD'),
                )
              ],
            ),
          )
        : AnimatedSplashScreen(
            duration: 5000,
            backgroundColor: Utilities.backgroundColor,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Lottie.asset('assets/json/lottie/splash_2.json')),
              ],
            ),
            splashIconSize: 400.h,
            nextScreen: const WelcomeScreen());
  }
}
