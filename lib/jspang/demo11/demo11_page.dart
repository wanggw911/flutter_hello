
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightSlideBackDemo extends StatefulWidget {
  RightSlideBackDemo({Key key}) : super(key: key);

  _RightSlideBackDemoState createState() => _RightSlideBackDemoState();
}

class _RightSlideBackDemoState extends State<RightSlideBackDemo> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: buildNavigationBar(context),
      child: SafeArea(
        child: Center(
          child: Container(
            height: 100.0,
            width: 100.0,
            color: CupertinoColors.activeBlue,
            child: CupertinoButton(
              child: Icon(CupertinoIcons.add, color: Colors.white),
              onPressed: (){
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (BuildContext context) {
                    return RightSlideBackDemo();
                  })
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  CupertinoNavigationBar buildNavigationBar(BuildContext context) {
    return CupertinoNavigationBar(
        trailing: CupertinoButton(
          child: Text('Save', style: TextStyle(color: CupertinoColors.activeBlue)),
          onPressed: () => Navigator.pop(context),
        ));
  }
}

