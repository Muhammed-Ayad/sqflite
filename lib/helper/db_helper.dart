import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  final String idColumn = 'id';
  final String tableName = 'notes';
  final String noteName = 'note';

  //  شرط مهم عشان تشغيل قواعد البيانات
  static Database? _database;
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialDB();
    }
    return _database;
  }

  initialDB() async {
    //مسار المشروع يعني مكام التخزين
    Directory docDirect = await getApplicationDocumentsDirectory();
    // لانشاء قواعد بيانات
    String path = join(docDirect.path, 'task_db.db');
    // لفتح قواعد البيانات
    var mydb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return mydb;
  }

  
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName($idColumn INTEGER PRIMARY KEY,$noteName TEXT)');
    print('Notes table Created');
  }

  //  اضافة عنصر
  Future<int> insert(Map<String, dynamic> data) async {
    var dbClient = await database;
    var insert = dbClient!.insert(tableName, data);
    return insert;
  }

  //  جلب البيانات
  Future<List> getData() async {
    var dbClient = await database;
    var notes = await dbClient!.query(tableName);
    return notes;
  }

  //  حذف عنصر
  Future<int> delete(int id) async {
    var dbClient = await database;
    var deleteNote =
        dbClient!.rawDelete('DELETE FROM $tableName WHERE $idColumn=$id');
    return deleteNote;
  }

  //التعديل علي عنصر
  Future<int> update(String note, int id) async {
    var dbClient = await database;
    var updateNote = dbClient!.rawUpdate(
        'UPDATE $tableName SET $noteName= $note WHERE $idColumn= $id');
    return updateNote;
  }

  // عنصر واحد فقط
  Future<List> getSingleRow(int id) async {
    var dbClient = await database;
    var note = await dbClient!.query(tableName, where: '$idColumn = "$id"');
    return note;
  }

  //من الحدث الي الاقدم
  Future<List> getDataOrderBy() async {
    var dbClient = await database;
    var note = await dbClient!.query(tableName, orderBy: '$idColumn DESC');
    return note;
  }

  // عدد محدود من النوت
  Future<List> getDataLimitation() async {
    var dbClient = await database;
    var note = await dbClient!.query(tableName, limit: 2);
    return note;
  }
}
