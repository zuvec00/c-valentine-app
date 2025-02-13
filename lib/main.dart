import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:c_valentine_app/constants/love_messages.dart';
import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/services/firebase_service/firebase_options.dart';
import 'package:c_valentine_app/services/noti_services/notification_service.dart';
import 'package:c_valentine_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> setOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((app) {
    if (kDebugMode) {
      print('Firebase initialized successfully');
    }
  });
}

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

Future<void> scheduleRandomLoveMessage() async {
  final Random random = Random();
  String randomMessage = loveMessages[random.nextInt(loveMessages.length)];

  //  Pass the randomized message to the notification function
  await NotificationService().scheduleDailyNotification(
    title: "Good Morning C! 🤍",
    body: randomMessage,
    hour: 10,
    minute: 0,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await setOrientation();
    setSystemUIOverlayStyle();
    await initializeFirebase();

    await NotificationService().initNotification();
    if (!isBeforeValentine()) {
      await scheduleRandomLoveMessage();
    }
  } catch (e, stackTrace) {
    if (kDebugMode) {
      print('Error during initialization: $e');
      print(stackTrace);
    }
    // Optionally, handle initialization errors (e.g., show an error screen)
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //  Listen to app lifecycle
    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
  }

  Future<void> _playBackgroundMusic() async {
    DateTime today = DateTime.now();
    DateTime targetDate = DateTime(2025, 2, 14); //  Valentine's Day 2025

    if (today.isBefore(targetDate)) {
      if (kDebugMode) {
        print("🎵 Music will not play until February 14, 2025.");
      }
      return; //  Exit the function if today is before the target date
    }
    if (isPlaying) return; //  Prevent duplicate audio from playing

    await _audioPlayer
        .stop(); //  Stop any existing playback before playing new audio
    await _audioPlayer.setReleaseMode(ReleaseMode.loop); //  Loop Music
    await _audioPlayer.setVolume(0.2);
    await _audioPlayer.play(AssetSource("audios/mac-miller.MP3"));

    setState(() {
      isPlaying = true; //  Mark audio as playing
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      _audioPlayer.stop(); //  Stop audio when app is minimized or closed
      isPlaying = false; //  Reset playing state
    } else if (state == AppLifecycleState.resumed) {
      _playBackgroundMusic(); //  Resume only if it's not already playing
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose(); //  Properly dispose of the player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            backgroundColor: Utilities.backgroundColor,
            titleTextStyle: TextStyle(
              fontFamily: 'PlayfairDisplay',
              color: Utilities.textColor,
            ),
          ),
          scaffoldBackgroundColor: Utilities.backgroundColor,
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Utilities.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          listTileTheme: const ListTileThemeData(
            leadingAndTrailingTextStyle: TextStyle(
              fontFamily: 'Poppins',
              color: Utilities.primaryColor,
            ),
            titleTextStyle: TextStyle(
              fontFamily: 'Poppins',
              color: Utilities.primaryColor,
            ),
            subtitleTextStyle: TextStyle(
              fontFamily: 'Poppins',
              color: Utilities.primaryColor,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
