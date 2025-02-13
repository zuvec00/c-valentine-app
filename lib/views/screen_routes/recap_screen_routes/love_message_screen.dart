import 'package:c_valentine_app/constants/love_messages.dart';
import 'package:c_valentine_app/constants/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LoveMessageScreen extends StatelessWidget {
  const LoveMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get today's date as a day number in the year (1 - 365)
    int dayOfYear = int.parse(DateFormat("D").format(DateTime.now()));

    // Pick a message based on today's day (loops back when exceeding the list length)
    String dailyMessage = loveMessages[dayOfYear % loveMessages.length];

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.chevron_left,
            color: Utilities.textColor,
          ),
        ),
        title: Text(
          'Today\'s Love Message 💌',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Text(
            dailyMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 40.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
