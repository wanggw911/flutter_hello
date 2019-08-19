import 'package:sqflite/sqflite.dart';
import 'package:flutter_hello/plugins/sqflite/database_hander.dart';
import 'package:flutter_hello/plugins/sqflite/student_model.dart';

class StudentDB {
  static final String table = 'Student';
  static final String id = 'id';
  static final String name = 'name';
  static final String age = 'age';
  static final String grade = 'grade';

  static createTableV1() {
    return '''
      CREATE TABLE $table(
      $id INTEGER PRIMARY KEY,
      $name TEXT,
      $age INTEGER, 
      $grade INTEGER
      )''';
  }

  //操作一：增

  static Future rawInsertWith(Student student) async {
    var database = await DatabaseHander.shared.db;
    await database.transaction((txn) async {
      //✅：不考虑主键重复的情况
      // var insertSql = '''
      // insert into $table($name, $age, $grade)
      // values(?, ?, ?)
      // ''';
      // var insertId = await txn.rawInsert(insertSql, [student.name, student.age, student.grade]);
      // print('插入数据一条，student id：$insertId');

      //✅：replace into
      var insertSql = '''
      replace into $table($id, $name, $age, $grade) 
      values(?, ?, ?, ?)
      ''';
      txn.execute(insertSql, [student.id, student.name, student.age, student.grade]);

      /* ❌ 不支持 insert ignore 的用法
        DB Error: 1 "near "ignore": syntax error"
        DB Query: insert ignore into Student(id, name, age, grade)values(?, ?, ?, ?)
        DB Path: /Users/dd01/Library/Developer/CoreSimulator/Devices/2D785F41-93A4-482D-A137-0C66DAE6BB00/data/Containers/Data/Application/94483C1D-4A4B-4B86-BA15-E53A24E09EAF/Documents/hello.db
       */
      // var insertSql = '''
      // insert ignore into $table($id, $name, $age, $grade) 
      // values(?, ?, ?, ?)
      // ''';
      //var insertId = await txn.rawInsert(insertSql, [student.id, student.name, student.age, student.grade]);
      //print('插入数据一条，student id：$insertId');
      
    });
  }

  static Future insertWith(Student student) async {
    var database = await DatabaseHander.shared.db;
    await database.transaction((txn) async {
      //插入数据方式一：不考虑可能出现的冲突情况
      //var id = await txn.insert('$table', student.toMap());
      //print('插入数据一条，student id：$id');
      //插入数据方式二：考虑主键冲突的情况，replace就是更新
      var id = await txn.insert('$table', student.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      print('插入数据一条，student id：$id');
    });
  }

  //操作一：删
  //操作一：改
  //操作一：查
  static Future<List<Student>> selectAll() async {
    List<Student> list = [];
    var database = await DatabaseHander.shared.db;
    var selectSql = 'select * from $table';
    List<Map> datalist = await database.rawQuery(selectSql);
    datalist.forEach((item) {
      list.add(Student.fromJson(item));
    });
    return list;
  }
}