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
    apiKey: 'AIzaSyA4FxJlgYap67jqb4W8It94o06ONq_Mzvg',
    appId: '1:200653066660:web:e796200e22d1b34ae97131',
    messagingSenderId: '200653066660',
    projectId: 'finder-352000',
    authDomain: 'finder-352000.firebaseapp.com',
    storageBucket: 'finder-352000.appspot.com',
    measurementId: 'G-K9GEBFH842',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7xyrfcwkP8UogM58vWwInmPotrh-bFHE',
    appId: '1:200653066660:android:100bcd02a3ffb646e97131',
    messagingSenderId: '200653066660',
    projectId: 'finder-352000',
    storageBucket: 'finder-352000.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLoBGI5muDno2HMH0bckpNXvJ7Bw761HI',
    appId: '1:200653066660:ios:585f5f7e7ec6036ae97131',
    messagingSenderId: '200653066660',
    projectId: 'finder-352000',
    storageBucket: 'finder-352000.appspot.com',
    iosBundleId: 'com.example.finder',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLoBGI5muDno2HMH0bckpNXvJ7Bw761HI',
    appId: '1:200653066660:ios:585f5f7e7ec6036ae97131',
    messagingSenderId: '200653066660',
    projectId: 'finder-352000',
    storageBucket: 'finder-352000.appspot.com',
    iosBundleId: 'com.example.finder',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA4FxJlgYap67jqb4W8It94o06ONq_Mzvg',
    appId: '1:200653066660:web:989e8c3a1ab9ad8ce97131',
    messagingSenderId: '200653066660',
    projectId: 'finder-352000',
    authDomain: 'finder-352000.firebaseapp.com',
    storageBucket: 'finder-352000.appspot.com',
    measurementId: 'G-0TQGCVKFFR',
  );
}