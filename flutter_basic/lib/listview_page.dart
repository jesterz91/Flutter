import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.favorite, color: Colors.red,),
                title: Text(items[index].name),
                subtitle: Text('${items[index].age}'),
                onTap: () => print(items[index].toString()),
              );
            })
    );
  }
}

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }
}

final items = [
  Person("나연", 25),
  Person("정연", 24),
  Person("모모", 24),
  Person("사나", 24),
  Person("지효", 23),
  Person("미나", 23),
  Person("다현", 22),
  Person("채영", 21),
  Person("쯔위", 21),
  Person("권은비", 25),
  Person("미야와키 사쿠라", 22),
  Person("강혜원", 21),
  Person("최예나", 21),
  Person("이채연", 20),
  Person("김채원", 20),
  Person("김민주", 19),
  Person("야부키 나코", 19),
  Person("혼다 히토미", 19),
  Person("조유리", 19),
  Person("안유진", 17),
  Person("장원영", 17),
];

