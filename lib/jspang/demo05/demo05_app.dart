
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo05/demo05_page.dart';

class Demo05 extends StatelessWidget {
  const Demo05({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 04',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: KeepAliveDemo(),
      ),
    );
  }
}