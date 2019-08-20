import 'package:flutter/material.dart';
import 'package:flutter_hello/widget/circle_widget.dart';
import 'package:flutter_hello/widget/clip_subview.dart';
import 'package:flutter_hello/widget/icon_enumerate.dart';
import 'package:flutter_hello/widget/listView.dart';
import 'package:flutter_hello/widget/pageview.dart';
import 'package:flutter_hello/widget/row.dart';

Map<String, Widget> learningMap = {
  "1、ListView实例": ListViewDemo(),
  "2、Row": RowDemos(),
  "3、PageView": PageViewPage(),
  "4、CircleWidget": CircleWidgetPage(),
  "5、Widget 裁剪": ClipSubWidgetDemo(),
  "6、CupertinoIcons Enumerate": IconsEnumerateListPage(),
};

List<String> learningList() {
  return learningMap.keys.toList().reversed.toList();
}

class WidgetListPage extends StatelessWidget {
  const WidgetListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widgets')),
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