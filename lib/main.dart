import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo01/demo01_app.dart';
import 'package:flutter_hello/jspang/demo02/demo02_bottom_appBar.dart';
import 'package:flutter_hello/jspang/demo03/demo03_pages.dart';
import 'package:flutter_hello/jspang/demo04/demo04_page.dart';
import 'package:flutter_hello/jspang/demo05/demo05_page.dart';
import 'package:flutter_hello/jspang/demo06/demo06_page.dart';

// Tips：可以在其他地方编写界面，然后在这里修改，就可以查看到效果了，需要删掉这个界面的东西
void main() => runApp(LearnApp());


// ------------------------------------------------------------------------

//编写一个列表，保存了学习技术胖的一个列表
const learningList = [
  "1、初始flutter演示项目",
  "2、底部导航栏",
  "3、不规则底部导航栏",
  "4、炫酷路由的效果",
  "5、毛玻璃效果制作",
  "6、保持页面状态",
  "7、一个不简单的搜索功能",
];

class LearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '跟着技术胖学习 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LearnListPage(),
    );
  }
}

class LearnListPage extends StatelessWidget {
  const LearnListPage({Key key}) : super(key: key);

  //思考一些，如果给 Page 添加下面的属性，要怎么去适配
  //List<String> _learningList; 
  // = learningList.reversed.toList();

  void _rounterJump(int index, BuildContext context) {
    print("-----准备跳转");
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        if (index == 0) {
          return MyHomePage(title: 'Flutter Demo Home Page');
        }
        else if (index == 1) {
          return BottomnavigationWidget();
        }
        else if (index == 2) {
          return BottomAppBarDemo();
        }
        else if (index == 3) {
          return FirstPage();
        }
        else if (index == 4) {
          return FrostedGlassDemo();
        }
        else if (index == 5) {
          return KeepAliveDemo();
        }
        else if (index == 6) {
          return SearchBarDemo();
        }
      })
    );
  }

  void _listItemTapAction(int index, BuildContext context) {
    //怎么把索引再次转换回来😂
    var value = learningList.reversed.toList()[index];
    var targetIndex = learningList.indexOf(value);
    print('列表被点击，索引是：$index，实际索引：$targetIndex');
    _rounterJump(targetIndex, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跟着技术胖学习 Flutter'),
      ),
      //后面再来一个专门的ListView专题，来适配各种可能遇到的情况：https://www.jianshu.com/p/83387758a591，参考这个
      body: ListView.separated(
        itemCount: learningList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${learningList.reversed.toList()[index]}'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            _listItemTapAction(index, context);
          },
        ),
        separatorBuilder: (context, index) {
          return Divider(height: 0.5, color: Colors.grey.shade200);
        },
      ),
    );
  }
}

// ------------------------------------------------------------------------
// TODO: 下面是原始的Demo

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
