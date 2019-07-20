
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo11/demo11_page.dart';

class Demo11 extends StatelessWidget {
  const Demo11({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '右滑返回上一页案例',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: RightSlideBackDemo(),
      ),
    );
  }
}