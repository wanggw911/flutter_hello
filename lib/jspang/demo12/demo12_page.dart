
import 'package:flutter/material.dart';

class ToolTipDemo extends StatefulWidget {
  ToolTipDemo({Key key}) : super(key: key);

  _ToolTipDemoState createState() => _ToolTipDemoState();
}

class _ToolTipDemoState extends State<ToolTipDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tooltip控件实例')),
      body: Center(
        child: Tooltip(
          message: '不要碰我，我怕痒',
          child: Icon(Icons.all_inclusive),
        ),
      ),
    );
  }
}

