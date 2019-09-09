import 'package:flutter/material.dart';
import 'package:flutter_app/listview_page.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hello Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _counterSubject = BehaviorSubject<int>();
  int _counter = 0;

  @override
  void dispose() {
    super.dispose();
    _counterSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () => print("setting")),
        ],
      ),
      drawer: _buildDrawer(context),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counterSubject.add(++_counter),
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
            stream: _counterSubject.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              }
              return Text('$_counter', style: Theme.of(context).textTheme.display1,);
            }
          ),
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
                Text("Nick Name", style: TextStyle(color: Colors.white),),
                Padding(padding: EdgeInsets.all(4)),
                Text("E-mail", style: TextStyle(color: Colors.white),),
              ],
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text("리스트"),
            leading: Icon(
              Icons.list,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => ListViewPage()));
            },
          ),
          ListTile(
            title: Text("메뉴2"),
            leading: Icon(
              Icons.star,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("메뉴3"),
            leading: Icon(Icons.search),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
