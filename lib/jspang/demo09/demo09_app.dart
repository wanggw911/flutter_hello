
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo09/demo09_page.dart';

class Demo09 extends StatelessWidget {
  const Demo09({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 04',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: ClipPathDemo(),
      ),
    );
  }
}