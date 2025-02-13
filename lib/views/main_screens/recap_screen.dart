import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/components/buttons.dart';
import 'package:c_valentine_app/views/screen_routes/recap_screen_routes/gallery_screen.dart';
import 'package:c_valentine_app/views/screen_routes/recap_screen_routes/love_message_screen.dart';
import 'package:c_valentine_app/views/screen_routes/recap_screen_routes/music_screen.dart';
import 'package:c_valentine_app/views/widgets/recap_screen_widgets.dart/bouncing_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecapScreen extends StatelessWidget {
  const RecapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100.h),

          // Title
          Text(
            "Let's recap our time together",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Utilities.textColor,
            ),
          ),

          SizedBox(
            height: 32.h,
          ),

          // Heart-shaped buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _heartButton('message', "Click me!", onTap: () {
                // Navigate to message screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  LoveMessageScreen()));
              }),
              SizedBox(width: 32.w),
              _heartButton('image', "Click me!", onTap: () {
                // Navigate to message screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GalleryScreen()));
              }),
              SizedBox(width: 32.w),
              _heartButton('musical-note', "Click me!", onTap: () {
                // Navigate to music screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MusicScreen()));
              }),
            ],
          ),

          // Navigation buttons
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Utilities.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              paddingWidth: 32.w,
              border: false,
              text: 'Go back',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Button(
              paddingWidth: 32.w,
              border: false,
              text: 'Next',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  // Widget for Heart Buttons
  Widget _heartButton(String icon, String text, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/heart-2.svg',
                height: 80.h,
                color: Utilities.textColor,
              ),
              SvgPicture.asset(
                'assets/icons/$icon.svg',
                color: Utilities.primaryColor,
                height: 28.h,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          BouncingText(text: text),
        ],
      ),
    );
  }
}
