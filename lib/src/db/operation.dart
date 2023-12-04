import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Operation {
  Future<Database> _OpenDB() {
    return openDatabase(join(getDatabasesPath(), "notes.db"),
      onCreate: (db, version){
      return db.execute(
        "CREATE TABLA notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT)");
      
    }, version: 1 );
}

}
