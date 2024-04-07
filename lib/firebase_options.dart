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
    apiKey: 'AIzaSyB-qCcgLCwGdJcHMxjD_JRgc-At_oSq-6s',
    appId: '1:730951847317:web:750f8eab35edf5596cfa9c',
    messagingSenderId: '730951847317',
    projectId: 'puputunggulprayoga',
    authDomain: 'puputunggulprayoga.firebaseapp.com',
    storageBucket: 'puputunggulprayoga.appspot.com',
    measurementId: 'G-XL71L333QC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvZ-yLe9T7aurGMbcSr1yLmRgWZVByyOQ',
    appId: '1:730951847317:android:14a765530a04cabf6cfa9c',
    messagingSenderId: '730951847317',
    projectId: 'puputunggulprayoga',
    storageBucket: 'puputunggulprayoga.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM8qb85XCE0jb3nq-MzQkFb-OBIquwsXQ',
    appId: '1:730951847317:ios:2422faafdf4eb4ba6cfa9c',
    messagingSenderId: '730951847317',
    projectId: 'puputunggulprayoga',
    storageBucket: 'puputunggulprayoga.appspot.com',
    iosBundleId: 'com.example.flutterHotelAppUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAM8qb85XCE0jb3nq-MzQkFb-OBIquwsXQ',
    appId: '1:730951847317:ios:2422faafdf4eb4ba6cfa9c',
    messagingSenderId: '730951847317',
    projectId: 'puputunggulprayoga',
    storageBucket: 'puputunggulprayoga.appspot.com',
    iosBundleId: 'com.example.flutterHotelAppUi',
  );
}
