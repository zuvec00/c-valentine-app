import 'dart:math';

import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/main_screens/love_counter_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  String enteredPasscode = "";
  late String correctPasscode;
  late String passcodeHint;

  final List<List<String>> passcodeList = [
    ['1105', 'When It All Started 🤍'],
    ['0209', 'When I Changed His Name to 🧸❤️'], // September 2, 2024 -> 24-09
    ['1805', 'First Kiss 💋'], // May 18, 2024 -> 24-05
    ['0806', 'First Movie Date 🍿'],
    ['1506', 'First Hotel Night Out 🏩'],
    ['0507', 'First Major Fight 🥊💔'],
    ['1807', 'First Time He Came To My House 🏡'],
    ['2707', 'First Time I Came To His Place 🏠'],
    ['0409', 'When He Told Me He Loves Me 😍'], // September 4, 2024 -> 24-09
    ['1609', 'When He Called Me His Love 🥰'], // September 16, 2024 -> 24-09
    [
      '2509',
      'First Time I Called Him Babe 🙂‍↔️🙂‍↕️'
    ], // September 25, 2024 -> 24-09
    ['2310', 'First Time I Said "I Love You Too" Unconsciously 😳'],
    ['2710', 'First S** 💦🍑'],
    ['0211', 'Our First Boat Cruise 🛥️'],
  ];

  final List<String> keys = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9",
    "", "0", "", // Empty for spacing, "0" at center, and backspace icon
  ];

  @override
  void initState() {
    super.initState();
    _generateRandomPasscode();
  }

  void _generateRandomPasscode() {
    final randomIndex = Random().nextInt(passcodeList.length);
    correctPasscode = passcodeList[randomIndex][0]; // Get passcode
    passcodeHint = passcodeList[randomIndex][1]; // Get hint
  }

  void _onKeyPress(String value) {
    setState(() {
      if (enteredPasscode.length < 4) {
        enteredPasscode += value;
      }
    });

    if (enteredPasscode.length == 4) {
      _validatePasscode();
    }
  }

  void _validatePasscode() {
    if (enteredPasscode == correctPasscode) {
      // ✅ Passcode is correct, navigate or show success dialog
      if (kDebugMode) {
        print("Correct Passcode: $enteredPasscode");
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoveCounterScreen();
      }));
    } else {
      // ❌ Incorrect passcode, reset the field
      setState(() {
        enteredPasscode = "";
      });
    }
  }

  void _deletePasscode() {
    setState(() {
      if (enteredPasscode.isNotEmpty) {
        enteredPasscode =
            enteredPasscode.substring(0, enteredPasscode.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8.h),

          Text(
            "Enter Passcode",
            style: TextStyle(
              color: Utilities.textColor,
              fontSize: 24.sp,
              fontFamily: "PlayfairDisplay",
            ),
          ),

          SizedBox(height: 32.h),

          // Passcode Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: index < enteredPasscode.length ? 0 : 1,
                    color: Colors.white54,
                  ),
                  color: index < enteredPasscode.length
                      ? Utilities.textColor
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),

          SizedBox(height: 24.h),
          // Display the Hint for the Current Passcode
          Text(
            "Hint: $passcodeHint",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.sp,
              fontFamily: "Poppins",
              fontStyle: FontStyle.italic,
            ),
          ),

          SizedBox(height: 24.h),

          // Keypad
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: keys.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 0.w,
                childAspectRatio: 1.45,
              ),
              itemBuilder: (context, index) {
                return keys[index].isEmpty
                    ? const SizedBox.shrink()
                    : GestureDetector(
                        onTap: () => _onKeyPress(keys[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Utilities.primaryColor,
                            border: Border.all(
                                color: Utilities.textColor, width: 0.75),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            keys[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Utilities.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text('Go back')),
            GestureDetector(
                onTap: () => _deletePasscode(), child: const Text('Delete')),
          ],
        ),
      ),
    );
  }
}
