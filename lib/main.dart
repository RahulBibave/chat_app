import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constant/constant.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCz5BZDy8iq0EUTitL0w--YsPhUUvDmwLY",
            authDomain: "chat-app-50d8a.firebaseapp.com",
            projectId: "chat-app-50d8a",
            storageBucket: "chat-app-50d8a.appspot.com",
            messagingSenderId: "460189515646",
            appId: "1:460189515646:web:8a7367b0b0daae7984bd2f"
        ));
  }else{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }
  getUserLoggedInStatus()async{
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if(value!=null){
        isSignedIn =value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      home: isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}

