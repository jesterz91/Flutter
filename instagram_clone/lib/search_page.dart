import 'package:flutter/material.dart';
import 'package:instagram_clone/create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGridView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.create),
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          childAspectRatio: 1.0,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
      "https://avatars1.githubusercontent.com/u/66577?s=460&v=4",
      fit: BoxFit.cover,
    );
  }
}
