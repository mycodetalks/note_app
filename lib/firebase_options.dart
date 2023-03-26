
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
    apiKey: 'AIzaSyCJVb1TpYWNB2jy_-X0UNIX7MYC9lqwLhk',
    appId: '1:527920515340:web:50ea777cde60cba8806129',
    messagingSenderId: '527920515340',
    projectId: 'note-taking-2bcce',
    authDomain: 'note-taking-2bcce.firebaseapp.com',
    storageBucket: 'note-taking-2bcce.appspot.com',
    measurementId: 'G-SH86L81GWG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4KfevpA3zmHP_iMcWxVThQtvBOcTCqLs',
    appId: '1:527920515340:android:b4b42902ca6e4a90806129',
    messagingSenderId: '527920515340',
    projectId: 'note-taking-2bcce',
    storageBucket: 'note-taking-2bcce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHDvlQdSeadgUOffh6I7R8kM9vbWyWbfU',
    appId: '1:527920515340:ios:61d4073569dc0d7a806129',
    messagingSenderId: '527920515340',
    projectId: 'note-taking-2bcce',
    storageBucket: 'note-taking-2bcce.appspot.com',
    iosClientId: '527920515340-65nu012fe6k4icuqt8pi9gv7qc8at4te.apps.googleusercontent.com',
    iosBundleId: 'com.example.noteTaking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHDvlQdSeadgUOffh6I7R8kM9vbWyWbfU',
    appId: '1:527920515340:ios:61d4073569dc0d7a806129',
    messagingSenderId: '527920515340',
    projectId: 'note-taking-2bcce',
    storageBucket: 'note-taking-2bcce.appspot.com',
    iosClientId: '527920515340-65nu012fe6k4icuqt8pi9gv7qc8at4te.apps.googleusercontent.com',
    iosBundleId: 'com.example.noteTaking',
  );
}
