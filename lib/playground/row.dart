
import 'package:flutter/material.dart';

class RowDemos extends StatelessWidget {
  const RowDemos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row Demos'),),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Row: mainAxisAlignment：MainAxisAlignment.start'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Divider(), //可以自定义分割线的颜色 
            Text('Row: mainAxisAlignment：MainAxisAlignment.center',),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Text('Row: mainAxisAlignment：MainAxisAlignment.end'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Text('Row: mainAxisAlignment：MainAxisAlignment.spaceBetween'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                //Container( width: 100,height: 20.0,color: Colors.blue),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Text('Row: mainAxisAlignment：MainAxisAlignment.spaceAround'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Text('Row: mainAxisAlignment：MainAxisAlignment.spaceEvenly\n注：等距居中显示'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Text('Row: 使用 Expanded 自动撑开'),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Expanded(child: Container(),),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Text('Row: 使用 Expanded 自动撑开'),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Expanded(child: Container(),),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Expanded(child: Container(),),
                Container(width: 100,height: 20.0,color: Colors.green),
              ],
            ),
            Text('Row: 使用 Expanded 自动撑开，会实现类似spaceEvenly的效果'),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Container(),),
                Container(width: 100, height: 20.0, color: Colors.red),
                Expanded(child: Container(),),
                Container( width: 100,height: 20.0,color: Colors.blue),
                Expanded(child: Container(),),
                Container(width: 100,height: 20.0,color: Colors.green),
                Expanded(child: Container(),),
              ],
            ),
            Text('Row: 使用 Expanded 自动撑开，ListView前后布局的时候需要使用到'),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Expanded(child: Container(child: Text('我是Expanded', textAlign: TextAlign.center,),),),
                Container( width: 100,height: 20.0,color: Colors.blue),
              ],
            ),
            Text('Row: textDirection: TextDirection.rtl'),
            Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Container(width: 100, height: 20.0, color: Colors.red),
                Container( width: 100,height: 20.0,color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}