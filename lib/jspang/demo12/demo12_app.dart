
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo12/demo12_page.dart';

class Demo12 extends StatelessWidget {
  const Demo12({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tooltip控件实例',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: ToolTipDemo(),
      ),
    );
  }
}