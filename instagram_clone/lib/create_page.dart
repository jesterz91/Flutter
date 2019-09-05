import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
    return Column(
      children: <Widget>[
        Text("No Image"),
        TextField(
          controller: _textEditingController,
          decoration: InputDecoration(hintText: "내용을 입력하세요"),
        )
      ],
    );
  }
}
