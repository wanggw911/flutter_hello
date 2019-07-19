import 'package:flutter/material.dart';

void main() => runApp(MyApp02());

class MyApp02 extends StatelessWidget {
  const MyApp02({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Deme Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //1、下划线的变量表示私有变量
  int _counter = 0;

  //2、定义个增加counter的方法
  void _incrementCounter() {
    //只有调用了setState()这个方法，才会去更新UI
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //3、脚手架 widget 会包含导航栏等一些自带空间
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text(
               'You hava pushed the button this many times',
             ),
             Text(
               '$_counter',
               style: Theme.of(context).textTheme.display1,
             ),
           ],
         ),
       ),
       floatingActionButton: FloatingActionButton(
         //注意：方法的调用，没有参数的话，是不用写括号的，不然会提示警告
         onPressed: _incrementCounter,
         tooltip: 'Increment',
         child: Icon(Icons.add),
       ),
    );
  }
}