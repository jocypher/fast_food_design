import 'package:fast_food_app_design/pages/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBH1oAt3BQUydBPUGc_cqN9ooaKmPMnSB4",
        projectId: "food-app-design-7e0c3",
        storageBucket: "food-app-design-7e0c3.appspot.com",
        messagingSenderId: "867396514102",
        appId: "1:867396514102:web:be76e01b340630daa58397"
        )
    );
  }else{
    await Firebase.initializeApp();
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const AnimationPage(),
    );
  }
}
