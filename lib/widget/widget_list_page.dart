import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/list_model.dart';
import 'package:flutter_hello/widget/circle_widget.dart';
import 'package:flutter_hello/widget/clip_subview.dart';
import 'package:flutter_hello/widget/cupertino_icons.dart';
import 'package:flutter_hello/widget/gridView.dart';
import 'package:flutter_hello/widget/listView.dart';
import 'package:flutter_hello/widget/material_icon.dart';
import 'package:flutter_hello/widget/pageview.dart';
import 'package:flutter_hello/widget/row.dart';

List<Example> learningList = [
  Example(title: '1、ListView', description: '', demoPage: ListViewDemo()),
  Example(title: '2、Row', description: '', demoPage: RowDemos()),
  Example(title: '3、PageView', description: '', demoPage: PageViewPage()),
  Example(title: '4、CircleWidget', description: '', demoPage: CircleWidgetPage()),
  Example(title: '5、Widget Clip', description: 'clip sub widget', demoPage: ClipSubWidgetDemo()),
  Example(title: '6、Cupertino Icons', description: 'gridView show all cupertino icons', demoPage: GridViewDemoPage()),
  //Example(title: '7、Cupertino Icons', description: '', demoPage: IconsEnumerateListPage()),
  Example(title: '7、Material Icons', description: 'gridView show all material icons', demoPage: MaterialIconsShowPage()),  
];

class WidgetListPage extends StatelessWidget {
  const WidgetListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widgets')),
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