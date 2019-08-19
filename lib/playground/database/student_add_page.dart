
import 'package:flutter/material.dart';
import 'package:flutter_hello/playground/database/student_model.dart';

class StudentAddPage extends StatefulWidget {
  StudentAddPage({Key key}) : super(key: key);

  _StudentAddPageState createState() => _StudentAddPageState();
}

class _StudentAddPageState extends State<StudentAddPage> {

  final _nameTEController = TextEditingController();
  final _ageTEController = TextEditingController();
  final _greadeTEController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('添加学生'),),
       body: _pageContent()
    );
  }

  Widget _pageContent() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
          onTap: () {
            _hiddenKeyboard();
          },
          child: Column(
            children: <Widget>[
              _inputItemContent("student name", TextInputType.text, Icon(Icons.account_circle), _nameTEController),
              _inputItemContent("student age", TextInputType.number, Icon(Icons.security), _ageTEController),
              _inputItemContent("student grade", TextInputType.number, Icon(Icons.security), _greadeTEController),
              _buttonContent()
            ],
          ),
      ),
    );
  }

  Widget _inputItemContent(String placeholder, TextInputType keyboardType, Icon icon, TextEditingController controller) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[200])),
      ), 
      child: Center(
        // [TextFormField使用](https://blog.csdn.net/yuzhiqiang_1993/article/details/88204031)
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          onEditingComplete: () {
            
          },
          decoration: InputDecoration(
            prefixIcon: icon,
            //hintText: "$placeholder",
            labelText: "$placeholder",
            border: InputBorder.none
          ),
          style: TextStyle(
            fontSize: 15, 
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Input can not be empty";
            }
            return "";
          },
        ),
      ),
    );
  }

  Widget _buttonContent() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: 44,
        width: 350,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('添加', style: TextStyle(color: Colors.white, fontSize: 20),),
          onPressed: () {
            _hiddenKeyboard();
            _submitAction();
          },
        ),
      ),
    );
  }

  void _hiddenKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _submitAction() {
    var name = _nameTEController.text;
    var age = int.parse(_ageTEController.text);
    var grade = int.parse(_greadeTEController.text);
    Student student = Student(name: name, age: age, grade: grade);
    //导航栏传值到
    Navigator.of(context).pop(student);
  }
}