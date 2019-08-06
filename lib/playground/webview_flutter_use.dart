
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatelessWidget {
  NewsDetailPage({
    Key key,
    this.title: '文章详情',
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)), //use for debug frame
        child: WebView(
          initialUrl: 'http://www.baidu.com',
          debuggingEnabled: true
        ),
      ) 
    );
  }
}