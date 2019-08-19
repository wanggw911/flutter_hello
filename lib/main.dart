import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_hello/index_page.dart';
import 'package:flutter_hello/plugins/http/http_use.dart';
import 'package:flutter_hello/plugins/provide/course_provide.dart';

void main() {
  final providers = Providers()
      ..provide(Provider<CourseProvide>.value(CourseProvide()));

  return runApp(ProviderNode(
    providers: providers,
    child: LearnApp(),
  ));
} 

class LearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Network.request(1);

    return MaterialApp(
      title: 'Flutter学习 ',
      debugShowCheckedModeBanner: false, //去掉App右上角的debug图标
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
