import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final email;

  HomePage(this.email);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.email)),
      body: Center(
        child: RaisedButton(
          child: Text('로그아웃'),
          onPressed: () => FirebaseAuth.instance.signOut(),
        ),
      ),
    );
  }
}
