import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/components/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomOneButtonAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String button1Text;
  final bool button1BorderEnabled;
  final Function()? onButton1Pressed;

  const CustomOneButtonAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.button1Text,
    required this.button1BorderEnabled,
    this.onButton1Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Utilities.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      content: Text(
        content,
        style: TextStyle(color: Utilities.secondaryColor, fontSize: 16.spMin),
      ),
      actions: [
        Row(
          children: [
            Expanded(
                child: Button(
              border: button1BorderEnabled,
              text: button1Text,
              onTap: onButton1Pressed,
            )),
          ],
        ),
      ],
    );
  }
}

class CustomTwoButtonAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String button1Text;
  final String button2Text;
  final bool button1BorderEnabled;
  final bool button2BorderEnabled;
  final Function()? onButton1Pressed;
  final Function()? onButton2Pressed;

  const CustomTwoButtonAlertDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.button1Text,
      required this.button2Text,
      required this.button1BorderEnabled,
      required this.button2BorderEnabled,
      this.onButton1Pressed,
      this.onButton2Pressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Utilities.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      content: Text(
        content,
        style: TextStyle(color: Utilities.secondaryColor, fontSize: 16.spMin),
      ),
      actions: [
        Row(
          children: [
            Expanded(
                child: Button(
              border: button1BorderEnabled,
              text: button1Text,
              onTap: onButton1Pressed,
            )),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
                child: Button(
              border: button2BorderEnabled,
              text: button2Text,
              onTap: onButton2Pressed,
            ))
          ],
        ),
      ],
    );
  }
}

class CustomTwoButtonColumnAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String button1Text;
  final String button2Text;
  final bool button1BorderEnabled;
  final bool button2BorderEnabled;
  final Function()? onButton1Pressed;
  final Function()? onButton2Pressed;

  const CustomTwoButtonColumnAlertDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.button1Text,
      required this.button2Text,
      required this.button1BorderEnabled,
      required this.button2BorderEnabled,
      this.onButton1Pressed,
      this.onButton2Pressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Utilities.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      content: Text(
        content,
        style: TextStyle(color: Utilities.secondaryColor, fontSize: 16.spMin),
      ),
      actions: [
        Column(
          children: [
            Button(
              border: button1BorderEnabled,
              text: button1Text,
              onTap: onButton1Pressed,
            ),
            SizedBox(
              height: 8.w,
            ),
            Button(
              border: button2BorderEnabled,
              text: button2Text,
              onTap: onButton2Pressed,
            )
          ],
        ),
      ],
    );
  }
}

class CustomOneButtonCupertinoDialog extends StatelessWidget {
  final String title;
  final String content;
  final String button1Text;
  final Function()? onButton1Pressed;

  const CustomOneButtonCupertinoDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.button1Text,
      this.onButton1Pressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onButton1Pressed,
          child: Text(
            button1Text,
            style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w400,
              color: Utilities.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTwoButtonCupertinoDialog extends StatelessWidget {
  final String title;
  final String content;
  final String button1Text;
  final String button2Text;
  final Function()? onButton1Pressed;
  final Function()? onButton2Pressed;
  const CustomTwoButtonCupertinoDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.button1Text,
      required this.button2Text,
      this.onButton1Pressed,
      this.onButton2Pressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'PlayfairDisplay',
          color: Utilities.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onButton1Pressed,
          child: Text(
            button1Text,
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
              color: Utilities.primaryColor,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: onButton2Pressed,
          child: Text(
            button2Text,
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
              color: Utilities.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
