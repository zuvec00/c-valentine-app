import 'dart:async';
import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/components/buttons.dart';
import 'package:c_valentine_app/views/main_screens/recap_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoveCounterScreen extends StatefulWidget {
  const LoveCounterScreen({super.key});

  @override
  State<LoveCounterScreen> createState() => _LoveCounterScreenState();
}

class _LoveCounterScreenState extends State<LoveCounterScreen> {
  late Timer _timer;
  late DateTime startDate;
  Duration elapsedTime = const Duration();

  @override
  void initState() {
    super.initState();
    startDate = DateTime(2024, 5, 11); // 11th May 2024
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime = DateTime.now().difference(startDate);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int days = elapsedTime.inDays;
    int hours = elapsedTime.inHours % 24;
    int minutes = elapsedTime.inMinutes % 60;
    int seconds = elapsedTime.inSeconds % 60;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 125.h,
            ),
            Text(
              "Since the day our story took a turn\nit's been...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Utilities.textColor,
              ),
            ),
            SizedBox(height: 32.h),

            // Timer Display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _timeBox("$days", "Days"),
                _timeBox("$hours", "Hours"),
                _timeBox("$minutes", "Minutes"),
                _timeBox("$seconds", "Seconds"),
              ],
            ),

            SizedBox(height: 32.h),
            Text(
              "... and still counting 🤍",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Utilities.textColor,
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(
                height: 150.h,
                child: Lottie.asset(
                  'assets/json/lottie/love_rl3.json',
                )),

            // Next Page Button
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Utilities.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              paddingWidth: 32.w,
              border: false,
              text: 'Next',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RecapScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }

  // Widget for the time boxes
  Widget _timeBox(String value, String unit) {
    return Padding(
      padding: EdgeInsets.only(
        left: unit.toLowerCase() == 'days' ? 24.w : 0.w,
        right: unit.toLowerCase() != 'seconds' ? 16.w : 0.w,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 40.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              unit,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        unit.toLowerCase() != 'seconds'
            ? Text(
                ':',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            : const SizedBox.shrink(),
      ]),
    );
  }
}
