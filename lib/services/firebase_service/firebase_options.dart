import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // static const FirebaseOptions android = FirebaseOptions(
  //   apiKey: 'AIzaSyBeSPkTRvSGa7IXE_jSODDxots_upwXFa8',
  //   appId: '1:72103487036:android:4864fb4858be93d3ddc539',
  //   messagingSenderId: '72103487036',
  //   projectId: 'stitches-africa',
  //   storageBucket: 'stitches-africa.firebasestorage.app',
  // );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBR79yGdvy7OJa8JxN15UQixx2qDE6plBo',
    appId: '1:871442757117:ios:d97ec4829854adc1c01594',
    messagingSenderId: '871442757117',
    projectId: 'c-valentine-app',
    storageBucket: 'c-valentine-app.firebasestorage.app',
    iosBundleId: 'com.example.cValentineApp',
  );
}
