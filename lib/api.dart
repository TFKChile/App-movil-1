import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUserOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'App',
            style: TextStyle(
                fontSize: 20, color: Colors.black, letterSpacing: 0.53),
          ),
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: const Center(child: Text('reserve-rest')),
      ),
    );
  }
}
