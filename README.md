# flutter_firebase_auth

This project demonstrates how to integrate Firebase Authentication into a Flutter application. It includes features such as user registration, login, and logout using Firebase's authentication services.

## Installation

### 1. Create Firebase Project
- Go to [Firebase Console](https://console.firebase.google.com/)
- Create a new project
- Set up Firebase for your Flutter app

### 2. Install Firebase Dependencies
Run the following command to install Firebase dependencies:
```sh
flutter pub add firebase_core firebase_auth
```

### 3. Install FlutterFire CLI
To link your Flutter project with Firebase, install FlutterFire CLI:
```sh
dart pub global activate flutterfire_cli
```

### 4. Configure Firebase in Your Project
Run the following command to configure Firebase with your Flutter project:
```sh
dart run flutterfire_cli configure --project=[FIREBASE-PROJECT-ID]
```
Replace `[FIREBASE-PROJECT-ID]` with your actual Firebase project ID.

### 5. Enable Authentication Method
- In the Firebase Console, go to **Authentication**
- Select **Sign-in method**
- Enable **Email/Password** authentication

### 6. Initialize Firebase in Your App
To use Firebase in your project, initialize it in `main.dart`:
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}
```

## User Authentication

### Create a New Account
Use `createUserWithEmailAndPassword()` to create a new user with an email and password:
```dart
final FirebaseAuth _auth = FirebaseAuth.instance;

UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  email: email,
  password: password,
);
```




