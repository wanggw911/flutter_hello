
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo08/demo08_page01.dart';

class Demo08 extends StatelessWidget {
  const Demo08({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 04',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: ExpansionTileDemo(),
      ),
    );
  }
}