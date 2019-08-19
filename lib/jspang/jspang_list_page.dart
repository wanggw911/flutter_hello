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
import 'package:flutter_hello/jspang/demo10/demo10_page.dart';
import 'package:flutter_hello/jspang/demo11/demo11_page.dart';
import 'package:flutter_hello/jspang/demo12/demo12_page.dart';
import 'package:flutter_hello/jspang/demo13/demo13_page.dart';

Map<String, Widget> learningMap = {
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
};

List<String> learningList() {
  return learningMap.keys.toList().reversed.toList();
}

class JSPangLearnListPage extends StatelessWidget {
  const JSPangLearnListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('跟着技术胖学习Flutter01')),
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

  void _listItemTapAction(int index, BuildContext context) {
    var key = learningList()[index];
    Widget widget = learningMap[key];
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return widget;
      })
    );
  }
}