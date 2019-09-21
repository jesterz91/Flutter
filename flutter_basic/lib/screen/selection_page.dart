import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Yep!'),
              onPressed: () => Navigator.pop(context, 'Yep!'),
            ),
            RaisedButton(
              child: Text('Nope.'),
              onPressed: () => Navigator.pop(context, 'Nope.'),
            ),
          ],
        ),
      ),
    );
  }
}
