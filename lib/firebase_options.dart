// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCD0YcRqXXGdBshMOVeV_zrAi5p0HnCJPU',
    appId: '1:531789100006:web:9208e2fbf15c727f5c5c27',
    messagingSenderId: '531789100006',
    projectId: 'solarproject-19ecb',
    authDomain: 'solarproject-19ecb.firebaseapp.com',
    databaseURL: 'https://solarproject-19ecb-default-rtdb.firebaseio.com',
    storageBucket: 'solarproject-19ecb.firebasestorage.app',
    measurementId: 'G-E71V5BMR60',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxegHmuWr670Ht09n35xvSzGUpyoCulsk',
    appId: '1:531789100006:android:446077101274c6e25c5c27',
    messagingSenderId: '531789100006',
    projectId: 'solarproject-19ecb',
    databaseURL: 'https://solarproject-19ecb-default-rtdb.firebaseio.com',
    storageBucket: 'solarproject-19ecb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdZFPOvy13flXZutR2vCRyxlMergGW2x0',
    appId: '1:531789100006:ios:958cdb223dedcbf65c5c27',
    messagingSenderId: '531789100006',
    projectId: 'solarproject-19ecb',
    databaseURL: 'https://solarproject-19ecb-default-rtdb.firebaseio.com',
    storageBucket: 'solarproject-19ecb.firebasestorage.app',
    iosBundleId: 'com.example.solar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdZFPOvy13flXZutR2vCRyxlMergGW2x0',
    appId: '1:531789100006:ios:958cdb223dedcbf65c5c27',
    messagingSenderId: '531789100006',
    projectId: 'solarproject-19ecb',
    databaseURL: 'https://solarproject-19ecb-default-rtdb.firebaseio.com',
    storageBucket: 'solarproject-19ecb.firebasestorage.app',
    iosBundleId: 'com.example.solar',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCD0YcRqXXGdBshMOVeV_zrAi5p0HnCJPU',
    appId: '1:531789100006:web:4af8e19b46692dbd5c5c27',
    messagingSenderId: '531789100006',
    projectId: 'solarproject-19ecb',
    authDomain: 'solarproject-19ecb.firebaseapp.com',
    databaseURL: 'https://solarproject-19ecb-default-rtdb.firebaseio.com',
    storageBucket: 'solarproject-19ecb.firebasestorage.app',
    measurementId: 'G-WWJRFWBFTD',
  );
}
