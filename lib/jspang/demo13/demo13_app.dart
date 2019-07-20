
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo13/demo13_page.dart';

class Demo13 extends StatelessWidget {
  const Demo13({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 04',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: DraggableDemo(),
      ),
    );
  }
}