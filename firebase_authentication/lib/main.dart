import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/helper/login_provier.dart';
import 'package:firebase_authentication/screen/home.dart';
import 'package:firebase_authentication/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) => snapshot.data == null
            ? ChangeNotifierProvider<LoginProvider>.value(
                value: LoginProvider(),
                child: LoginPage(),
              )
            : HomePage(snapshot.data.email),
      ),
    );
  }
}
