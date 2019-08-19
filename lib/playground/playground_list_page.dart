import 'package:flutter/material.dart';
import 'package:flutter_hello/playground/clip_subview/circle_widget.dart';
import 'package:flutter_hello/playground/clip_subview/clip.dart';
import 'package:flutter_hello/playground/request/filmListPage.dart';
import 'package:flutter_hello/playground/request/githubRepoList.dart';
import 'package:flutter_hello/playground/webview/flutter_webview_plugin_use.dart';
import 'package:flutter_hello/playground/webview/url_launcher_use.dart';
import 'package:flutter_hello/playground/webview/webview_flutter_use.dart';
import 'package:flutter_hello/playground/widget/listView.dart';
import 'package:flutter_hello/playground/widget/pageview.dart';
import 'package:flutter_hello/playground/widget/row.dart';

Map<String, Widget> learningMap = {
  "1、Widget：ListView实例": ListViewDemo(),
  "2、Widget：Row实例": RowDemos(),
  "3、Plugin：上下拉刷新": FilmListPage(),
  "4、仓库列表": GithubRepoPage(),
  "5、url_launcher插件使用": UrlLaunchPage(),
  "6、flutter_webview_plugin插件使用": FlutterWebviewPluginPage(),
  "7、flutter_webview_plugin插件使用": ArticleDetail(),
  "8、flutter_webview_plugin插件使用": WebViewExample(),
  "9、Plugin：webview_flutter": WebviewFlutterDemo(),
  "10、Widget：Widget 裁剪": ClipSubWidgetDemo(),
  "11、Plugin：url_launcher(跳转新界面打开网页)": UrlLaunchPage(),
  "12、Widget：PageView": PageViewPage(),
  "13、Widget：CircleWidget": CircleWidgetPage(),
};

List<String> learningList() {
  return learningMap.keys.toList().reversed.toList();
}

class PlaygroundListPage extends StatelessWidget {
  const PlaygroundListPage({Key key}) : super(key: key);

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