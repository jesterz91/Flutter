import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PersonDatabase {
  Database _database;
  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database;
  }

  static final _instance = PersonDatabase._internal();
  PersonDatabase._internal();
  factory PersonDatabase() => _instance;

  Future<Database> initDatabase() async {
    print('initDatabase');
    String path = join(await getDatabasesPath(), 'person.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE person(id INTEGER PRIMARY KEY, name TEXT)');
    print("PERSON TABLE CREATED!");
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      /* */
    }
  }
}