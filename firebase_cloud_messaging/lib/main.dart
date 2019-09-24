import 'package:firebase_cloud_messaging/message_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Cloud Messaging',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      // App in the foreground
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showItemDialog(context, message);
      },
      // App in the background
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // _navigateToItemDetail(message);
      },
      // App terminated
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    _firebaseMessaging.getToken().then((token) => print("toke = $token"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FCM')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('subscribe topic'),
              onPressed: () => _firebaseMessaging.subscribeToTopic('mytopic'),
            ),
            RaisedButton(
              child: Text('unsubscribe topic'),
              onPressed: () => _firebaseMessaging.unsubscribeFromTopic('mytopic'),
            ),
          ],
        ),
      ),
    );
  }

  void _showItemDialog(BuildContext context, Map<String, dynamic> message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message['notification']['title']),
        content: Text(message['notification']['body']),
        actions: <Widget>[
          FlatButton(
            child: Text('확인'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
