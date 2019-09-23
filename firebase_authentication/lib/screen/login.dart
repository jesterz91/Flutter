import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/helper/login_background.dart';
import 'package:firebase_authentication/helper/login_provier.dart';
import 'package:firebase_authentication/screen/reset.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) =>
            Stack(
              children: <Widget>[
                CustomPaint(
                  size: size,
                  painter: LoginBackground(isJoin: loginProvider.isJoin),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildLogo(),
                    Stack(
                      children: <Widget>[
                        _buildInputForm(size, loginProvider.isJoin),
                        _buildLoginButton(size, loginProvider.isJoin),
                      ],
                    ),
                    Container(height: size.height * 0.1),
                    GestureDetector(
                      child: Text(
                        loginProvider.isJoin
                            ? 'Alerady have one'
                            : 'Create New Account',
                        style: TextStyle(
                          fontSize: 16,
                          color: loginProvider.isJoin
                            ? Colors.red
                            : Colors.indigo,
                        ),
                      ),
                      onTap: () => loginProvider.toggle(),
                    ),
                    Container(height: size.height * 0.05),
                  ],
                )
              ],
            ),
      ),
    );
  }

  void _register(String email, String password) async {
    AuthResult authResult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = authResult.user;

    if (user == null) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('please try again later')));
    }
  }

  void _login(String email, String password) async {
    AuthResult authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = authResult.user;

    if (user == null) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('please try again later')));
    }
  }

  Widget _buildLogo() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 24, right: 24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            backgroundImage: AssetImage("asset/loading.gif"),
            // backgroundImage: NetworkImage("https://picsum.photos/200"),
          ),
        ),
      ),
    );
  }

  Widget _buildInputForm(Size size, bool isJoin) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 8.0,
        child: Padding(
          padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  validator: (email) => email.isEmpty ? "Please input correct E-mail" : null,
                  decoration: InputDecoration(icon: Icon(Icons.account_circle), labelText: "E-mail"),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (password) => password.isEmpty ? "Please input correct password" : null,
                  decoration: InputDecoration(icon: Icon(Icons.lock), labelText: "password"),
                ),
                Container(height: size.height * 0.02),
                Opacity(
                  opacity: isJoin ? 0 : 1,
                  child: GestureDetector(
                      child: Text('Forget Password'),
                      onTap: () => isJoin
                          ? null
                          : Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPage()))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(Size size, bool isJoin) {
    String buttonStr = isJoin ? "JOIN" : "LOGIN";

    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: RaisedButton(
        child: Text(
          '$buttonStr',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        color: isJoin ? Colors.red : Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            String email = _emailController.text;
            String password = _passwordController.text;

            isJoin ? _register(email, password) : _login(email, password);
          } else {
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('이메일과 비밀번호를 모두 입력하세요.')));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
