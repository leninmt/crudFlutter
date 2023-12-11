

import 'dart:ffi';

import 'package:crud/src/modelo/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Operation {
  Future<Database> _OpenDB() {
    return openDatabase(join(getDatabasesPath() as String, "notes.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLA notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT)");
    }, version: 1);
  }
//funcion insertar registros
Future<Future<int>> insert(Note note) async{
    Database database = await _OpenDB();
    return database.insert("notes", note.toMap());
  }

  //
  Future<List<Note>> notes(Note note) async{
    Database database = await _OpenDB();
    final List<Map<String, dynamic>> notesMap = await database.query("notes");
    for(var n in notesMap){
      print("______" + n["title"]);
    }
    return List.generate(notesMap.length, (i) => Note(
      id: notesMap[i]["id"] as Int, 
      title:notesMap[i]["title"] as String, 
      content:notesMap[i]["content"] as String));
  }
  static void notes(){}
}