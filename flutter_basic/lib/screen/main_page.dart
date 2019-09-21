import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screen/bmi_page.dart';
import 'package:flutter_app/screen/idol_page.dart';
import 'package:flutter_app/screen/selection_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => print("setting")
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(child: Text("menu4"), value: 4,),
              PopupMenuItem(child: Text("menu5"), value: 5,),
            ],
            onSelected: (value) => print(value),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.addCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('버튼 클릭 수',),
          StreamBuilder<int>(
              stream: counterBloc.count$,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data}', style: Theme.of(context).textTheme.display1,);
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 75,
                  height: 75,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/24826856?s=180&v=4"),
                  ),
                ),
                Padding(padding: EdgeInsets.all(4)),
                Text(
                  "Dev.Lee",
                  style: TextStyle(color: Colors.white),
                ),
                Padding(padding: EdgeInsets.all(4)),
                Text(
                  "email@gamil.com",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text("아이돌"),
            leading: Icon(Icons.favorite,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => IdolPage()));
            },
          ),
          ListTile(
            title: Text("BMI"),
            leading: Icon(Icons.person,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BmiPage()));
            },
          ),
          ListTile(
            title: Text("Pick"),
            leading: Icon(Icons.search),
            onTap: () => _navigateAndDisplaySelection(context),
          ),
        ],
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    Navigator.of(context).pop();
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionPage()),
    );
    _scaffoldKey.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}