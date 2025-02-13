import 'dart:math';

import 'package:c_valentine_app/constants/songs.dart';
import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/widgets/music_screen_widgets.dart/song_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  static final Random _random = Random(); // Create a Random instance

// Function to get a random MainAxisAlignment value
  MainAxisAlignment getRandomAlignment() {
    return _random.nextBool() ? MainAxisAlignment.start : MainAxisAlignment.end;
  }

  @override
  Widget build(BuildContext context) {
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
          'Songs that remind me of you 🙂‍↔️',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> song = songs[index];
                  return SongCardWidget(
                    songData: song,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
