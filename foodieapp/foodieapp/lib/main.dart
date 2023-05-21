import 'package:firebase_core/firebase_core.dart';
import 'package:foodieapp/details.dart';
import 'package:foodieapp/home.dart';
import 'package:foodieapp/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data == null) {
            return const LoginPage();
          } else {
            User user = snapshot.data as User;
            if (user.displayName == "" || user.displayName == null) {
              return DetailsPage();
            } else {
              return const HomePage();
            }
          }
        },
      ),
    );
  }
}
