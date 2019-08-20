import 'package:flutter/cupertino.dart';
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
import 'package:flutter_hello/jspang/jspang_describe_page.dart';
import 'package:flutter_hello/list_model.dart';

List<Example> learningList = [
  Example(title: '1、底部导航栏', description: '展示底部导航栏', demoPage: BottomnavigationWidget()),
  Example(title: '2、不规则底部导航栏', description: '', demoPage: BottomAppBarDemo()),
  Example(title: '3、炫酷路由的效果', description: '', demoPage: FirstPage()),
  Example(title: '4、毛玻璃效果制作', description: '', demoPage: FrostedGlassDemo()),
  Example(title: '5、保持页面状态-顶部横向导航栏', description: '', demoPage: KeepAliveDemo()),
  Example(title: '6、一个不简单的搜索功能', description: '', demoPage: SearchBarDemo()),
  Example(title: '7、流式布局，模拟添加照片的效果', description: '', demoPage: WarpLayoutDemo()),
  Example(title: '8、展开闭合案例', description: '', demoPage: ExpansionTileDemo()),
  Example(title: '9、贝塞尔曲线切割', description: '', demoPage: ClipPathDemo()),
  Example(title: '10、打开应用的闪屏动画案例', description: '代码报错了，还没解决', demoPage: SplashScreenDemo()),
  Example(title: '11、右滑返回上一页案例', description: '', demoPage: RightSlideBackDemo()),
  Example(title: '12、tooltip控件实例', description: '', demoPage: ToolTipDemo()),
  Example(title: '13、draggable控件实例', description: '', demoPage: DraggableDemo()),
];

class JSPangLearnListPage extends StatelessWidget {
  const JSPangLearnListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSPang Demos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              _goDescribePage(context);
            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: learningList.length,
        itemBuilder: (context, index) {
          Example example = learningList.reversed.toList()[index];
          return ListTile(
            title: Text('${example.title}'),
            trailing: Icon(CupertinoIcons.right_chevron),
            subtitle: example.description.isNotEmpty ? Text('${example.description}') : null,
            onTap: () {
              _listItemTapAction(context, example);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0.5, color: Colors.grey.shade200);
        },
      ),
    );
  }

  void _listItemTapAction(BuildContext context, Example example) {
    Widget widget = example.demoPage;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return widget;
      })
    );
  }

  void _goDescribePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return AboutJSPangPage();
      })
    );
  }
}