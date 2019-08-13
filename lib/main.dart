import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo01/demo01_app.dart';
import 'package:flutter_hello/jspang/demo02/demo02_bottom_appBar.dart';
import 'package:flutter_hello/jspang/demo03/demo03_pages.dart';
import 'package:flutter_hello/jspang/demo04/demo04_page.dart';
import 'package:flutter_hello/jspang/demo05/demo05_page.dart';
import 'package:flutter_hello/jspang/demo06/demo06_page.dart';
import 'package:flutter_hello/jspang/demo07/demo07_page.dart';
import 'package:flutter_hello/jspang/demo08/demo08_page01.dart';
import 'package:flutter_hello/jspang/demo09/demo09_page.dart';
// import 'package:flutter_hello/jspang/demo10/demo10_app.dart';
import 'package:flutter_hello/jspang/demo10/demo10_page.dart';
import 'package:flutter_hello/jspang/demo11/demo11_page.dart';
import 'package:flutter_hello/jspang/demo12/demo12_page.dart';
import 'package:flutter_hello/jspang/demo13/demo13_page.dart';
import 'package:flutter_hello/playground/clip.dart';
import 'package:flutter_hello/playground/deviceInfo.dart';
import 'package:flutter_hello/playground/flutter_webview_plugin_use.dart';
import 'package:flutter_hello/playground/listView.dart';
import 'package:flutter_hello/playground/request/filmListPage.dart';
import 'package:flutter_hello/playground/request/filmListProvide.dart';
import 'package:flutter_hello/playground/request/githubRepoList.dart';
import 'package:flutter_hello/playground/request/httpUse.dart';
import 'package:flutter_hello/playground/row.dart';
import 'package:flutter_hello/playground/url_launcher_use.dart';
import 'package:flutter_hello/playground/webview_flutter_use.dart';
import 'package:provide/provide.dart';

// Tips：可以在其他地方编写界面，然后在这里修改，就可以查看到效果了，需要删掉这个界面的东西
void main() {
  final providers = Providers()
      ..provide(Provider<CourseProvide>.value(CourseProvide()));

  return runApp(ProviderNode(
    providers: providers,
    child: LearnApp(),
  ));

} //=> runApp();
// void main() => runApp(Demo10());


// ------------------------------------------------------------------------

//编写一个Map，保存了学习技术胖的一个列表（原来是list，但是存在需要使用if判断，才能进行跳转，比较麻烦）
// TODO: 增加一个类来管理下面的Map，增加subtitle来展示Demo的主要知识点
Map<String, Widget> learningMap = {
  "0、初始flutter演示项目": MyHomePage(title: 'Flutter Demo Home Page'),
  "1、底部导航栏": BottomnavigationWidget(),
  "2、不规则底部导航栏": BottomAppBarDemo(),
  "3、炫酷路由的效果": FirstPage(),
  "4、毛玻璃效果制作": FrostedGlassDemo(),
  "5、保持页面状态-顶部横向导航栏": KeepAliveDemo(),
  "6、一个不简单的搜索功能": SearchBarDemo(),
  "7、流式布局，模拟添加照片的效果": WarpLayoutDemo(),
  "8、展开闭合案例": ExpansionTileDemo(), 
  "9、贝塞尔曲线切割": ClipPathDemo(), 
  "10、打开应用的闪屏动画案例": SplashScreenDemo(), 
  "11、右滑返回上一页案例": RightSlideBackDemo(),
  "12、tooltip控件实例": ToolTipDemo(),
  "13、draggable控件实例": DraggableDemo(),
  "14、ListView控件实例": ListViewDemo(),
  "15、Row控件实例": RowDemos(),
  "16、电影列表上下拉刷新": FilmListPage(),
  "17、仓库列表": GithubRepoPage(),
  "18、url_launcher插件使用": UrlLaunchPage(),
  "19、flutter_webview_plugin插件使用": FlutterWebviewPluginPage(),
  "20、flutter_webview_plugin插件使用": ArticleDetail(),
  "21、flutter_webview_plugin插件使用": WebViewExample(),
  "22、webview_flutter插件使用": NewsDetailPage(),
  "23、widget 裁剪": ClipSubWidgetDemo(),
};

List<String> learningList() {
  return learningMap.keys.toList().reversed.toList();
}

class LearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //TestRequest.decode();
    //TestRequest.request();
    Network.request(1);

    return MaterialApp(
      title: '跟着技术胖学习 Flutter',
      debugShowCheckedModeBanner: false, //去掉App右上角的debug图标
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LearnListPage(),
    );
  }
}

class LearnListPage extends StatelessWidget {
  const LearnListPage({Key key}) : super(key: key);

  void _listItemTapAction(int index, BuildContext context) {
    var key = learningList()[index];
    print("点击的item是：$key");
    Widget widget = learningMap[key];
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return widget;
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跟着技术胖学习 Flutter'),
      ),
      //后面再来一个专门的ListView专题，来适配各种可能遇到的情况：https://www.jianshu.com/p/83387758a591，参考这个
      body: ListView.separated(
        itemCount: learningMap.keys.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${learningList()[index]}'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
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
// 下面是原始的Demo

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

  _getWH() {
    //https://juejin.im/post/5c827600f265da2da67c5f06
    //会报错。。。
    // final GlobalKey globalKey = GlobalKey();
    // final containerWidth = globalKey.currentContext.size.width;
    // final containerHeight = globalKey.currentContext.size.height;
    // print('Container widht is $containerWidth, height is $containerHeight');
  }

  @override
  Widget build(BuildContext context) {
    _getWH();
    Device.getDeviceInfo(context);
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
            Container(
              color: Colors.red,
              width: 414,
              height: 20.0,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text('123'),
                  Divider(color: Colors.grey, height: 1.0),
                  Text('456'),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 50.0,
              child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
              //child: Container(width: 100, height: 100.0, color: Colors.red),
            ),
            Image.network('https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p17525.webp'),
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
