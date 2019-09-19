import 'package:flutter/material.dart';
import 'package:persistence/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()),
                          (Route<dynamic> route) => false);
                })
          ],
      ),
      body: Center(
        child: Text("welcome", style: Theme.of(context).textTheme.display1,),
      ),
    );
  }
}
