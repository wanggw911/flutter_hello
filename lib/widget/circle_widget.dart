
import 'package:flutter/material.dart';

class CircleWidgetPage extends StatelessWidget {
  const CircleWidgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CircleWidgetDemo'),),
      body: _content(),
    );
  }

  Widget _content() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              color: Colors.red,
              width: 414,
              height: 20.0,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text('123'),
                  Divider(color: Colors.grey, height: 1.0),
                  Text('456'),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 50.0,
              child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
              //child: Container(width: 100, height: 100.0, color: Colors.red),
            ),
            Image.network('https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p17525.webp'),
        ],
      ),
    );
  }
}