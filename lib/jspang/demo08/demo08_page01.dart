
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo08/demo08_page02_expanList.dart';

class ExpansionTileDemo extends StatefulWidget {
  ExpansionTileDemo({Key key}) : super(key: key);

  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('简单的展开闭合案例'),
       ),
       body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ExpansionListDemo();
                    })
                  );
                },
                child: Text('点击跳转到：展开闭合列表'),
              ),
              ExpansionTile(
                title: Text('Expansion Title'),
                leading: Icon(Icons.ac_unit),
                backgroundColor: Colors.white12,
                children: <Widget>[
                  ListTile(
                    title: Text('list title'),
                    subtitle: Text('subtitle'),
                  )
                ],
                initiallyExpanded: true,
              ),
            ],
          ),
       ),
    );
  }
}

