import 'dart:io';

import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/components/buttons.dart';
import 'package:c_valentine_app/views/components/custom_dialog.dart';
import 'package:c_valentine_app/views/main_screens/passcode_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _showValentineDialog(BuildContext context) {
    if (Platform.isIOS) {
      // Cupertino Dialog for iOS
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CustomTwoButtonCupertinoDialog(
            title: 'Be my Valentine? 🤍',
            content:
                'You can\'t proceed to the next page without being my Valentine.😔\n\nI\'m currently "Valentineless" and if you\'re in the same situation (which you better be… or just delete this app 🙄💁🏾‍♂️), then…\n\nWould you be my Valentine, C? 🤍🥹',
            button1Text: 'Naaa,never.',
            button2Text: 'Fs, I\'m obsessed with you! 😝',
            onButton1Pressed: () => Navigator.pop(context),
            onButton2Pressed: () async {
              Navigator.pop(context);
              showLottieDialog(context);
            },
          );
        },
      );
    }
  }

  void _showGirlfriendDialog(BuildContext context) {
    if (Platform.isIOS) {
      // Cupertino Dialog for iOS
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CustomTwoButtonCupertinoDialog(
            title: 'Just You & Me?',
            content:
                'No fancy lines, no over the top speech… just me, asking you, the person who makes my days better, if you\'d want to make this something real.\n\nSo, what do you think? Would you be my girlfriend?',
            button1Text: 'No',
            button2Text: 'Yes',
            onButton1Pressed: () => Navigator.pop(context),
            onButton2Pressed: () async {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const PasscodeScreen();
              }));
            },
          );
        },
      );
    }
  }

  void showLottieDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Lottie.asset(
            'assets/json/lottie/hurray.json',
            repeat: false, // Play once
            onLoaded: (composition) {
              Future.delayed(composition.duration, () {
                Navigator.of(context).pop();
                _showGirlfriendDialog(context);
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/json/lottie/happy-valentine.json'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Utilities.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'I  L O V E  Y O U 🤍',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w400,
              ),
            ),
            Button(
              paddingWidth: 32.w,
              border: false,
              text: 'Next',
              onTap: () {
                _showValentineDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
