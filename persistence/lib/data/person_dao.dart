import 'package:persistence/data/person_database.dart';
import 'package:persistence/model/person.dart';
import 'package:sqflite/sql.dart';

class PersonDao {
  final _friendDatabase = PersonDatabase();

  Future<int> insert(Person person) async {
    final db = await _friendDatabase.database;
    return await db.insert('person', person.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(Person person) async {
    final db = await _friendDatabase.database;
    return await db.update('person', person.toJson(), where: "id = ?", whereArgs: [person.id]);
  }

  Future<int> delete(int id) async {
    final db = await _friendDatabase.database;
    return await db.delete('person', where: "id = ?", whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final db = await _friendDatabase.database;
    return await db.delete('person');
  }

  Future<List<Person>> fetchAll() async {
    final db = await _friendDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query('person');
    return List.generate(maps.length, (index) => Person.fromJson(maps[index]));
  }
}