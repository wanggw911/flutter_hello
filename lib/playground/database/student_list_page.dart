
import 'package:flutter/material.dart';
import 'package:flutter_hello/playground/database/student_add_page.dart';
import 'package:flutter_hello/playground/database/student_db.dart';
import 'package:flutter_hello/playground/database/student_model.dart';

class StudentListPage extends StatefulWidget {
  StudentListPage({Key key}) : super(key: key);

  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<Student> _datasource = [];

  @override
  void initState() {
    super.initState();

    //页面加载完毕请求数据
    WidgetsBinding.instance.addPostFrameCallback((_){ 
      _loadLocationData();
      //_testInsetConflictData();
      //_testInsetConflictData02();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('学生列表'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              _addStudent(context);
            },
          )
        ],
      ),
      body: _bodyContent(),
    );
  }

  Widget _bodyContent() {
    return ListView.separated(
      itemCount: _datasource.length,
      separatorBuilder: (context, index) {
        return Divider(height: 0.5, color: Colors.grey.shade200);
      },
      itemBuilder: (context, index) {
        Student student = _datasource[index];
        return ListTile(
          title: Text('${student.name}'),
          subtitle: Text('年龄：${student.age}，年级：${student.grade}'),
        );
      },
    );
  }

  void _addStudent(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return StudentAddPage();
      })
    );

    Student student = result as Student;
    if (student == null) {
      print('student is null, can not insert to database!');
      return;
    }

    setState(() {
      _datasource.add(student);
    });
    addStudentToDB(student);
  }

  void _loadLocationData() async {
    var list = await StudentDB.selectAll();
    setState(() {
      _datasource.addAll(list);
    });
  }

  void addStudentToDB(Student student) {
    StudentDB.insertWith(student);
    //StudentDB.rawInsertWith(student);
  }

  void _testInsetConflictData() async {
    Student student = Student(id: 3, name: 'Jike', age: 15, grade: 7);
    StudentDB.insertWith(student);

    var list = await StudentDB.selectAll();
    list.forEach((item) {
      print(item.toMap().toString());
    });

    student = Student(id: 3, name: 'Mike', age: 10, grade: 4);
    StudentDB.insertWith(student);

    list = await StudentDB.selectAll();
    list.forEach((item) {
      print(item.toMap().toString());
    });
  }

  void _testInsetConflictData02() async {
    Student student = Student(id: 4, name: 'Jike2', age: 15, grade: 7);
    StudentDB.insertWith(student);

    var list = await StudentDB.selectAll();
    list.forEach((item) {
      print(item.toMap().toString());
    });

    print('-----');
    student = Student(id: 4, name: 'Mike2', age: 10, grade: 4);
    StudentDB.rawInsertWith(student);
    
    list = await StudentDB.selectAll();
    list.forEach((item) {
      print(item.toMap().toString());
    });
  }
}