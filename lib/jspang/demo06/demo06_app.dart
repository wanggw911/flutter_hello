
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo06/demo06_page.dart';

class Demo06 extends StatelessWidget {
  const Demo06({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 04',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: SearchBarDemo(),
      ),
    );
  }
}