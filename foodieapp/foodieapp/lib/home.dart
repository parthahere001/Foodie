import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _idToken = "";
    FirebaseAuth.instance.currentUser!
        .getIdToken()
        .then((value) => _idToken = value);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Welcome ${FirebaseAuth.instance.currentUser!.displayName!}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
