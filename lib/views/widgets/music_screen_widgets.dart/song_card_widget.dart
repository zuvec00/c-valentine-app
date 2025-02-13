import 'dart:async';
import 'dart:math';
import 'package:c_valentine_app/constants/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SongCardWidget extends StatefulWidget {
  final Map<String, dynamic> songData;

  const SongCardWidget({super.key, required this.songData});

  @override
  State<SongCardWidget> createState() => _SongCardWidgetState();
}

class _SongCardWidgetState extends State<SongCardWidget> {
  final Random _random = Random();
  MainAxisAlignment _alignment = MainAxisAlignment.start;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _alignment = _getRandomAlignment(); // Set initial random alignment
    _startAnimationLoop();
  }

  // Function to toggle alignment randomly
  MainAxisAlignment _getRandomAlignment() {
    return _random.nextBool() ? MainAxisAlignment.start : MainAxisAlignment.end;
  }

  // Function to get a random duration (1s - 3s)
  Duration _getRandomDuration() {
    return Duration(milliseconds: 1000 + _random.nextInt(2000));
  }

  void _startAnimationLoop() {
    _timer = Timer.periodic(_getRandomDuration(), (timer) {
      if (mounted) {
        setState(() {
          _alignment = _getRandomAlignment();
        });
      }
    });
  }

  Future<void> launchSong({required String url}) async {
    final Uri urlParsed = Uri.parse(url);
    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Stop timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      curve: Curves.easeInOut,
      duration: _getRandomDuration(),
      alignment: _alignment == MainAxisAlignment.start
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          launchSong(url: widget.songData['link']);
        },
        child: Container(
          width: 248.w,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Utilities.primaryColor,
            border: Border.all(width: 0.75.w, color: Utilities.textColor),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: Image.asset(
                    'assets/images/${widget.songData['album-cover']}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.songData['title'],
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      widget.songData['artist'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
