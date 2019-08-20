
import 'package:flutter/material.dart';
import 'package:flutter_hello/widget/cupertino_icons.dart';

class GridViewDemoPage extends StatefulWidget {
  GridViewDemoPage({Key key}) : super(key: key);

  _GridViewDemoPageState createState() => _GridViewDemoPageState();
}

class _GridViewDemoPageState extends State<GridViewDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CupertinoIcons'),),
      body: _content(),
    );
  }

  Widget _content() {
    return Container(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,      // 每行列数：3列
            childAspectRatio: 5/3,  // 宽高比：3/3就是宽高相等
        ),
        itemCount: cupertinoIconsMapList.length,
        itemBuilder: (context, index) {
          return _gridViewItem(index);
        },
      ),
    );
  }

  Widget _gridViewItem(int index) {
    Map map = cupertinoIconsMapList[index];
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.red)), //use for debug frame
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(map.values.first as IconData),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('${map.keys.first}'),
            )
          ],
        ),
      ),
    );
  }
}