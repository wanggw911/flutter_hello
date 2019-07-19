
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo02/bottom_appBar_demo.dart';

class Demo02 extends StatelessWidget {
  const Demo02({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),
      home: BottomAppBarDemo(),
    );
  }
}