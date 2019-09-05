import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  File _image;

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("새 게시물"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.send), onPressed: () {}),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null ? Text("No Image") : Image.file(_image),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: "내용을 입력하세요"),
          )
        ],
      ),
    );
  }

  void _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
