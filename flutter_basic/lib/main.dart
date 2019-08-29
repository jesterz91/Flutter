import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HelloPage("Hello Flutter"));
  }
}

class HelloPage extends StatefulWidget {
  final String title;

  HelloPage(this.title);

  @override
  State createState() => _HelloPageSate();
}

class _HelloPageSate extends State<HelloPage> {
  String _message = 'Hello Flutter';
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: () => _changeMessage()),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_message, style: TextStyle(fontSize: 30)),
                Text('$_counter', style: TextStyle(fontSize: 30)),
                RaisedButton(
                  child: Text('화면 이동'),
                  onPressed: () => {
                    MaterialPageRoute(builder: (context) {
                      
                    })
                  })
              ],
            )));
  }

  void _changeMessage() {
    setState(() {
      _message = "안녕 플러터";
      _counter++;
    });
  }
}
