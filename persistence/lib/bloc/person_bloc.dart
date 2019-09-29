import 'dart:async';

import 'package:persistence/data/person_dao.dart';
import 'package:persistence/model/person.dart';

class PersonBloc {
  final _personDao = PersonDao();
  final _streamCtrl = StreamController<List<Person>>.broadcast();

  static final PersonBloc _instance = PersonBloc._internal();

  PersonBloc._internal();

  factory PersonBloc() => _instance..fetchAll();

  Stream<List<Person>> get stream => _streamCtrl.stream;

  Future<void> fetchAll() async {
    _streamCtrl.sink.add(await _personDao.fetchAll());
  }

  Future<void> insert(Person person) async {
    await _personDao.insert(person);
    fetchAll();
  }

  Future<void> update(Person person) async {
    await _personDao.update(person);
    fetchAll();
  }

  Future<void> delete(int id) async {
    await _personDao.delete(id);
    fetchAll();
  }

  Future<void> deleteAll() async {
    await _personDao.deleteAll();
    fetchAll();
  }

  dispose() => _streamCtrl.close();
}
