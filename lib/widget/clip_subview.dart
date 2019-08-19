
import 'package:flutter/material.dart';

class ClipSubWidgetDemo extends StatelessWidget {
  const ClipSubWidgetDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget裁剪'),),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.green),
            ),
            ClipRRect( //剪裁为圆角矩形
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                        child: Text('被裁剪了。。。', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                      )
                    ),
                    Expanded(
                      child: Container(
                      decoration: BoxDecoration(color: Colors.green),
                    ),
                    ),
                    Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                        child: Text('被裁剪了。。。', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                      )
                    ),
                  ],
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}