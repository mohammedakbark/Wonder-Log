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
    apiKey: 'AIzaSyBnZ9IoSOH39LdY8hxYfe_hwNHtA10S1jo',
    appId: '1:1089703732984:web:82af4440a1aacdf1d6fd0d',
    messagingSenderId: '1089703732984',
    projectId: 'wonderlog',
    authDomain: 'wonderlog.firebaseapp.com',
    storageBucket: 'wonderlog.appspot.com',
    measurementId: 'G-85QL5CB9GP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsKM9YZN1-AWBrilXSvHRVRSBxqcG2hdY',
    appId: '1:1089703732984:android:c4b771f582c94a7bd6fd0d',
    messagingSenderId: '1089703732984',
    projectId: 'wonderlog',
    storageBucket: 'wonderlog.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBidpJoXXUNcrvJYB-NZP8i15zlZ1NSnc0',
    appId: '1:1089703732984:ios:53ace6d793570418d6fd0d',
    messagingSenderId: '1089703732984',
    projectId: 'wonderlog',
    storageBucket: 'wonderlog.appspot.com',
    iosBundleId: 'com.example.wanderlog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBidpJoXXUNcrvJYB-NZP8i15zlZ1NSnc0',
    appId: '1:1089703732984:ios:4a53a9da1a4c0f2fd6fd0d',
    messagingSenderId: '1089703732984',
    projectId: 'wonderlog',
    storageBucket: 'wonderlog.appspot.com',
    iosBundleId: 'com.example.wanderlog.RunnerTests',
  );
}
