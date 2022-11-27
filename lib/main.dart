import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wefly_project/screens/PlayStation.dart';
import 'package:wefly_project/screens/firstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
var auth = FirebaseAuth.instance;
var isLogin = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      title: 'WeFly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (checkUserState() == true ?  PlayStation() : new FirstScreen()),

    );
  }
  bool checkUserState() {
    return !(auth.currentUser == null);
  }
}


