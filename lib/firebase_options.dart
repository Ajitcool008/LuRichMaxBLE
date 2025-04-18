// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default FirebaseOptions for use with your Firebase apps.
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

  // Replace these with your Firebase configuration values
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCnUtG1d-ohRs5gzpGNQkRXQ_Q_LUTpZoc",
    authDomain: "lurichmaxble-166d3.firebaseapp.com",
    projectId: "lurichmaxble-166d3",
    storageBucket: "lurichmaxble-166d3.firebasestorage.app",
    messagingSenderId: "157338042835",
    appId: "1:157338042835:web:b944d16b9935c0cec42f26",
    measurementId: "G-KDGKEJNPVP",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChUDDH64TmaaQXy1kJ1a6f40FIb_WB-EE',
    appId: '1:157338042835:android:00b6573a86ccd18cc42f26',
    messagingSenderId: '157338042835',
    projectId: 'lurichmaxble-166d3',
    storageBucket: 'lurichmaxble-166d3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiQEE1k_Rb_lQ4uhmptb7HMMA-Dbbd00U',
    appId: '1:157338042835:ios:5d58f05e2cc85c25c42f26',
    messagingSenderId: '157338042835',
    projectId: 'lurichmaxble-166d3',
    storageBucket: 'lurichmaxble-166d3.firebasestorage.app',
    iosBundleId: 'com.lurichmaxble.lurichmaxble',
    // Optional if not present in plist:
    iosClientId:
        '', // ← You can leave this empty or retrieve it from your plist if available.
  );
}
