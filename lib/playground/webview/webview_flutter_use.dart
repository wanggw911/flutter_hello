
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//使用参考：[webView_flutter 的使用](https://www.jianshu.com/p/f2465b06c89c)
// 必须先使用 Xcode 运行一下，才能展示出网页😂，错了，是必须添加这个设置：javascriptMode: JavascriptMode.unrestricted,
// 还是有点坑爹哈。。。。
class WebviewFlutterDemo extends StatefulWidget {
  WebviewFlutterDemo({Key key}) : super(key: key);

  _WebviewFlutterDemoState createState() => _WebviewFlutterDemoState();
}

class _WebviewFlutterDemoState extends State<WebviewFlutterDemo> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('webview_flutter插件使用'),),
      body: Container(
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)), //use for debug frame
        child: WebView(
          //initialUrl: "https://flutterchina.club/",
          initialUrl: 'http://www.baidu.com',
          javascriptMode: JavascriptMode.unrestricted,
          //debuggingEnabled: true,
          onPageFinished: (String value) {
              // webview 页面加载调用
              print(value);
          },
          onWebViewCreated: (c) {
            _controller = c;
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadwebView,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // 
    );
  }

  _loadwebView() {
    _controller.loadUrl('http://www.baidu.com');
  }
}