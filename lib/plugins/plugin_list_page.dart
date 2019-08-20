import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/list_model.dart';
import 'package:flutter_hello/plugins/flutter_webview_plugin/flutter_webview_plugin_use.dart';
import 'package:flutter_hello/plugins/sqflite/student_list_page.dart';
import 'package:flutter_hello/plugins/url_launcher/url_launcher_use.dart';
import 'package:flutter_hello/plugins/webview_flutter/webview_flutter_use.dart';

List<Example> learningList = [
  Example(title: '1、url_launcher', description: '跳转新界面打开网页', demoPage: UrlLaunchPage()),
  Example(title: '2、webview_flutter', description: '', demoPage: WebviewFlutterDemo()),
  Example(title: '3、flutter_webview_plugin', description: '', demoPage: FlutterWebviewPluginPage()),
  Example(title: '4、sqflite 数据库', description: '', demoPage: StudentListPage()),
];

class PluginListPage extends StatelessWidget {
  const PluginListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Plugins')),
      body: ListView.separated(
        itemCount: learningList.length,
        itemBuilder: (context, index) {
          Example example = learningList.reversed.toList()[index];
          return ListTile(
            title: Text('${example.title}'),
            subtitle: example.description.isNotEmpty ? Text('${example.description}') : null,
            trailing: Icon(CupertinoIcons.right_chevron),
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
}