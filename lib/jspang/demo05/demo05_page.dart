
import 'package:flutter/material.dart';

class KeepAliveDemo extends StatefulWidget {
  KeepAliveDemo({Key key}) : super(key: key);

  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

/*
  with是dart的关键字，意思是混入的意思，
  就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
  避免多重继承导致的问题。
  SingleTickerProviderStateMixin 主要是我们初始化TabController时，
  需要用到vsync ，垂直属性，然后传递this
*/
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }
  
  //重写被释放的方法，只释放 TabController
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text('Keep Alive Demo'),
         bottom: TabBar(
           controller: _controller,
           tabs: <Widget>[
             Tab(icon: Icon(Icons.directions_car)),
             Tab(icon: Icon(Icons.directions_transit)),
             Tab(icon: Icon(Icons.directions_bike)),
           ],
         ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            //Center(child: Text('1111')),
            //Center(child: Text('2222')),
            //Center(child: Text('3333')),
            TabbarPage(),
            TabbarPage(),
            TabbarPage(),
          ],
        ),
    );
  }
}

class TabbarPage extends StatefulWidget {
  TabbarPage({Key key}) : super(key: key);

  _TabbarPageState createState() => _TabbarPageState();
}

//混入AutomaticKeepAliveClientMixin，这是保持状态的关键
//然后重写wantKeppAlive 的值为true。
class _TabbarPageState extends State<TabbarPage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  
  //重写keepAlive 为ture ，就是可以有记忆功能了。
  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('点一下加1，点一下加1：'),
             Text('$_counter', style: Theme.of(context).textTheme.display1)
           ],
         ),
       ),
       //增加一个悬浮按钮，点击时触发增加方法
       floatingActionButton: FloatingActionButton(
         onPressed: _incrementCounter,
         tooltip: 'Increment',
         child: Icon(Icons.add),
       ),
    );
  }
}