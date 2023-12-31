// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAyQUpp2iU0mCLFQn5u2nxz3VfSBFvLj_Y',
    appId: '1:218422031515:web:cd1ab48a045f9fd0c8823e',
    messagingSenderId: '218422031515',
    projectId: 'vitalpulse-ce830',
    authDomain: 'vitalpulse-ce830.firebaseapp.com',
    storageBucket: 'vitalpulse-ce830.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADp4hdMgm06XbZM51Ni-o5exiX_Q7DcPw',
    appId: '1:218422031515:android:ff94103c511de81fc8823e',
    messagingSenderId: '218422031515',
    projectId: 'vitalpulse-ce830',
    storageBucket: 'vitalpulse-ce830.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9ou-GMOwKBvvuk9L6Q1tl5mJpg5ZBDcU',
    appId: '1:218422031515:ios:68a442cf2c0f9d86c8823e',
    messagingSenderId: '218422031515',
    projectId: 'vitalpulse-ce830',
    storageBucket: 'vitalpulse-ce830.appspot.com',
    iosClientId: '218422031515-95aeeu7614fdbqi1leeted0513heod83.apps.googleusercontent.com',
    iosBundleId: 'com.example.vitalPulse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9ou-GMOwKBvvuk9L6Q1tl5mJpg5ZBDcU',
    appId: '1:218422031515:ios:51f4e6a34691427ec8823e',
    messagingSenderId: '218422031515',
    projectId: 'vitalpulse-ce830',
    storageBucket: 'vitalpulse-ce830.appspot.com',
    iosClientId: '218422031515-dtcug5ncgpja5ekdksnudu5vjv0o0qis.apps.googleusercontent.com',
    iosBundleId: 'com.example.vitalPulse.RunnerTests',
  );
}
