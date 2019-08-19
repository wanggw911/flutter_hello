import 'package:flutter/material.dart';
import 'package:flutter_hello/plugins/flutter_webview_plugin/flutter_webview_plugin_use.dart';
import 'package:flutter_hello/plugins/sqflite/student_list_page.dart';
import 'package:flutter_hello/plugins/url_launcher/url_launcher_use.dart';
import 'package:flutter_hello/plugins/webview_flutter/webview_flutter_use.dart';

Map<String, Widget> learningMap = {
  //"Plugin: 上下拉刷新": FilmListPage(),
  "1、url_launcher（跳转新界面打开网页）": UrlLaunchPage(),
  "2、webview_flutter": WebviewFlutterDemo(),
  "3、flutter_webview_plugin": FlutterWebviewPluginPage(),
  "4、sqflite 数据库": StudentListPage(),
};

List<String> learningList() {
  return learningMap.keys.toList().reversed.toList();
}

class PluginListPage extends StatelessWidget {
  const PluginListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Plugins')),
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