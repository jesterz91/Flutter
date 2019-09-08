import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user;

  CreatePage(this.user);

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
        IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _uploadImage();
            }),
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

  void _uploadImage() {
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child("post")
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = firebaseStorageRef.putFile(
        _image, StorageMetadata(contentType: "image/png"));

    task.onComplete.then((value) {
      var downloadUrl = value.ref.getDownloadURL();

      downloadUrl.then((uri) {
        var doc = Firestore.instance.collection('post').document();
        doc.setData({
          'id': doc.documentID,
          'photoUrl': uri.toString(),
          'contents': _textEditingController.text,
          'email': widget.user.email,
          'displayName': widget.user.displayName,
          'userPhotoUrl': widget.user.photoUrl
        }).then((value) {
          Navigator.pop(context);
        });
      });
    });
  }
}
