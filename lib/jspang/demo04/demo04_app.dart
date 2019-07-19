
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo04/demo04_page.dart';

class Demo04 extends StatelessWidget {
  const Demo04({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 04',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: FrostedGlassDemo(),
      ),
    );
  }
}