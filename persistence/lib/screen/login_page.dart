import 'package:flutter/material.dart';
import 'package:persistence/screen/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  SharedPreferences sharedPreferences;
  bool checkValue = false;
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: SingleChildScrollView(
        child: _buildBody(),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30.0),
            child: Image.asset("assets/images/flutter_icon.png", height: 100.0,),
          ),
          TextField(
            controller: username,
            decoration: InputDecoration(
              hintText: "아이디를 입력하세요",
              hintStyle: TextStyle(color: Colors.red.withOpacity(0.8))),
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "비밀번호를 입력하세요",
              hintStyle: TextStyle(color: Colors.red.withOpacity(0.8)))),
          CheckboxListTile(
            title: Text("로그인 정보 기억하기"),
            value: checkValue,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() => checkValue = value);
            },
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: ListTile(
              title: Text("로그인", textAlign: TextAlign.center,),
              onTap: _login,
            ),
          )
        ],
      ),
    );
  }

  void _login() {
    if (username.text.length != 0 && password.text.length != 0) {
      _saveLogin(checkValue);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MainPage()),
              (Route<dynamic> route) => false);
    } else {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("로그인"),
          content: Text("아이디와 비밀번호를 모두 입력하셔야 합니다."),
          actions: <Widget>[
            FlatButton(
              child: Text("확인"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      });
    }
  }

  _saveLogin(bool isRemember) async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (isRemember) {
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("username", username.text);
      sharedPreferences.setString("password", password.text);
    } else {
      sharedPreferences.clear();
    }
  }

  _getLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool check = sharedPreferences.getBool("check");
    if (check != null) {
      setState(() {
        checkValue = check;
        if (check) {
          username.text = sharedPreferences.getString("username");
          password.text = sharedPreferences.getString("password");
        } else {
          username.clear();
          password.clear();
        }
      });
    }
  }
}