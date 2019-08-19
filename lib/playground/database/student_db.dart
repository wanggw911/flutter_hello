
import 'package:flutter_hello/playground/database/database_hander.dart';
import 'package:flutter_hello/playground/database/student_model.dart';

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
      var insertSql = '''
      insert into $table($name, $age, $grade)
      values(?, ?, ?)
      ''';
      var id = await txn.rawInsert(insertSql, [student.name, student.age, student.grade]);
      print('插入数据一条，student id：$id');
    });
  }

  static Future insertWith(Student student) async {
    var database = await DatabaseHander.shared.db;
    await database.transaction((txn) async {
      var id = await txn.insert(table, student.toMap());
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