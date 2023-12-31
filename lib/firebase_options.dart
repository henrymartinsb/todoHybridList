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
    apiKey: 'AIzaSyChfA2eoAWc6S47PLl32bd0Y4eobOXBF6c',
    appId: '1:827423694336:web:037b4d0fd11ee25aaf02e5',
    messagingSenderId: '827423694336',
    projectId: 'todohybridlist',
    authDomain: 'todohybridlist.firebaseapp.com',
    storageBucket: 'todohybridlist.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6JNnJNfhn748gccpKooQUjWAl_hOKemY',
    appId: '1:827423694336:android:468809e84fd0479eaf02e5',
    messagingSenderId: '827423694336',
    projectId: 'todohybridlist',
    storageBucket: 'todohybridlist.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAk4tIwWqXDiC8k5KZq7llYb-ca6ZobRIw',
    appId: '1:827423694336:ios:92f63831627a43a2af02e5',
    messagingSenderId: '827423694336',
    projectId: 'todohybridlist',
    storageBucket: 'todohybridlist.appspot.com',
    iosClientId: '827423694336-cmu01arfnt2qljfd2ir8mtenrrr9b67n.apps.googleusercontent.com',
    iosBundleId: 'com.spacedsoft.todoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAk4tIwWqXDiC8k5KZq7llYb-ca6ZobRIw',
    appId: '1:827423694336:ios:107b25855c232015af02e5',
    messagingSenderId: '827423694336',
    projectId: 'todohybridlist',
    storageBucket: 'todohybridlist.appspot.com',
    iosClientId: '827423694336-7aiosipcpfrlte82vci4q1hcb47q5kcn.apps.googleusercontent.com',
    iosBundleId: 'com.spacedsoft.todoList.RunnerTests',
  );
}
