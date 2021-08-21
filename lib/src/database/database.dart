import 'package:bloc_exercice/src/model/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider instance = DatabaseProvider._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
     _database = await initdatabase();
     return _database;
  }

  initdatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'note.db'),
        onCreate: (db, version) async {
      await db.execute("""
        CREATE TABLE tables (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT,password TEXT
        )
        """);
    }, version: 1);
  }


  addNew(Model model) async{
    final db = await database ;
    db!.insert("tables", model.toMap() );
  }

  Future<dynamic> getList()async  {
    final db = await database ;
    return db!.query("tables");
  }
}


