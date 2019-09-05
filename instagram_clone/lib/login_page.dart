import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Instagram Clone",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(50.0)),
            SignInButton(
              Buttons.Google,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
