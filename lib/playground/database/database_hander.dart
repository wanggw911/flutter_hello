import 'package:flutter_hello/playground/database/student_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //join method need import

class DatabaseHander {
  static final DatabaseHander shared = DatabaseHander();
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    else {
      _db = await _initDatabase();
      return _db;
    }
  }
 
  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hello.db');
    
    Database database = await openDatabase(path, 
      version: 1,
      onCreate: (Database db, int version) async {
        print("数据表版本1.0，onCreate");
        var batch = db.batch();
        _createVersion1Tables(batch);
        await batch.commit();
      }
    );
    return database;
  }

  Future closeDatabase() async {
    var database = await db;
    await database.close();
  }

  // 数据表1.0
  void _createVersion1Tables(Batch batch) {
    batch.execute(StudentDB.createTableV1());
  }
}