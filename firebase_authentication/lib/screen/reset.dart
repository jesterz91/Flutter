import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비밀번호 재설정')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _emailController,
                validator: (email) =>
                    email.isEmpty ? "Please input correct E-mail" : null,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'E-mail',
                  hintText: '이메일을 입력하세요',
                ),
              ),
            ),
            Container(
              height: 16,
            ),
            RaisedButton(
              child: Text('비밀번호 재설정'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  final email = _emailController.text;
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                  Scaffold.of(_formKey.currentContext)
                      .showSnackBar(SnackBar(content: Text('이메일을 확인 후 비밀번호를 재 설정하세요')));
                } else {
                  Scaffold.of(_formKey.currentContext)
                      .showSnackBar(SnackBar(content: Text('이메일을 입력하세요')));
                }
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
