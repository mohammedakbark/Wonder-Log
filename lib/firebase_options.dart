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
    apiKey: 'AIzaSyAg3fLs9vNbPJTJmgsmAkfEXCWT-JIuzXc',
    appId: '1:220145242763:web:be8e8087ff8f2303c53a8e',
    messagingSenderId: '220145242763',
    projectId: 'wanderloguser',
    authDomain: 'wanderloguser.firebaseapp.com',
    storageBucket: 'wanderloguser.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZCx3BkNJQb0ObGLNB_EUPF1FMgk2W1vE',
    appId: '1:220145242763:android:dbf6d3aa92accb1ac53a8e',
    messagingSenderId: '220145242763',
    projectId: 'wanderloguser',
    storageBucket: 'wanderloguser.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEsnUID2kZjWbg_3OYpL6_RzjSDupvo5k',
    appId: '1:220145242763:ios:713f3191fd0bf207c53a8e',
    messagingSenderId: '220145242763',
    projectId: 'wanderloguser',
    storageBucket: 'wanderloguser.appspot.com',
    iosBundleId: 'com.example.wanderlog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEsnUID2kZjWbg_3OYpL6_RzjSDupvo5k',
    appId: '1:220145242763:ios:713f3191fd0bf207c53a8e',
    messagingSenderId: '220145242763',
    projectId: 'wanderloguser',
    storageBucket: 'wanderloguser.appspot.com',
    iosBundleId: 'com.example.wanderlog',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAg3fLs9vNbPJTJmgsmAkfEXCWT-JIuzXc',
    appId: '1:220145242763:web:8e5f57bff21a4517c53a8e',
    messagingSenderId: '220145242763',
    projectId: 'wanderloguser',
    authDomain: 'wanderloguser.firebaseapp.com',
    storageBucket: 'wanderloguser.appspot.com',
  );
}
