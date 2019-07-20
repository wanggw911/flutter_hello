
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo07/demo07_page.dart';

class Demo07 extends StatelessWidget {
  const Demo07({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 04',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: WarpLayoutDemo(),
      ),
    );
  }
}