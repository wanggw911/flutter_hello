
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo03/pages.dart';

class Demo03 extends StatelessWidget {
  const Demo03({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo03',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}