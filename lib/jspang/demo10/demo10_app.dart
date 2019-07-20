
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo10/demo10_page.dart';

class Demo10 extends StatelessWidget {
  const Demo10({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '打开应用的闪屏动画案例',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreenDemo()
    );
  }
}