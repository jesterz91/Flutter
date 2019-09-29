import 'package:flutter/material.dart';
import 'package:persistence/bloc/person_bloc.dart';
import 'package:persistence/model/person.dart';
import 'package:persistence/screen/register_page.dart';
import 'package:persistence/screen/login_page.dart';

class MainPage extends StatelessWidget {
  final _personBloc = PersonBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("person"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: _personBloc.deleteAll,
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage(),
                ),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _personBloc.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) =>
            snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) =>
                        _buildRow(context, snapshot.data[index]),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
      ),
    );
  }

  Widget _buildRow(BuildContext context, Person person) {
    return Dismissible(
      key: Key("${person.id}"),
      onDismissed: (direction) => _personBloc.delete(person.id),
      background: Container(color: Colors.red),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('${person.name}'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(person: person)));
        },
      ),
    );
  }
}
