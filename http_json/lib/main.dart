import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_json/picture.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP&JSON',
      home: PhotoPage(),
    );
  }
}

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  List<Photo> _photos = [];

  void _fetchPhoto() async {
    int page = 1;
    int limit = 30;

    var response = await http.get('https://picsum.photos/v2/list?page=$page&limit=$limit');

    if (response.statusCode == 200) {
      jsonDecode(response.body).forEach((value) => {
        setState(() {
          _photos.add(Photo.fromJson(value));
          page++;
        })
      });
    } else {
      print("Error!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP&JSON Tutorial"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _fetchPhoto();
              })
        ],
      ),
      body: ListView.builder(
          itemCount: _photos.length,
          itemBuilder: (context, index) {
            Photo photo = _photos[index];

            return Card(child: Column(
              children: <Widget>[
                Text(photo.author),
                Image.network("https://picsum.photos/id/${photo.id}/150/150")
              ],
            ));
          }),
    );
  }
}
