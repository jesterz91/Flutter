import 'package:flutter/material.dart';
import 'package:persistence/bloc/person_bloc.dart';
import 'package:persistence/model/person.dart';

class RegisterPage extends StatefulWidget {
  final Person person;

  RegisterPage({this.person});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _personBloc = PersonBloc();
  final _nameCtrl = TextEditingController();

  @override
  void initState() {
    if (widget.person != null) {
      setState(() {
        _nameCtrl.text = widget.person.name;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "이름",
                  hintText: "이름을 입력해주세요"),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                child: Text('cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              widget.person == null
                  ? RaisedButton(
                      child: Text('insert'),
                      onPressed: () {
                        _personBloc.insert(Person(name: _nameCtrl.text));
                        _nameCtrl.clear();
                        Navigator.pop(context);
                      },
                    )
                  : RaisedButton(
                      child: Text('update'),
                      onPressed: () {
                        _personBloc
                            .update(widget.person..name = _nameCtrl.text);
                        _nameCtrl.clear();
                        Navigator.pop(context);
                      },
                    ),
            ],
          )
        ],
      ),
    );
  }
}
