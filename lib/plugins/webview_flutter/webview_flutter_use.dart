
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
      appBar: AppBar(
        title: Text('webview_flutter usage'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: _navigationGobackAction,
        ),
      ),
      body: _webViewContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadwebView,
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ), // 
    );
  }

  Widget _webViewContent() {
    return Container(
        //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)), //use for debug frame
        child: WebView(
          initialUrl: 'https://www.baidu.com', //⚠️iOS 加载 http 的地址，需要在 info.plist 中设置
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (String value) {
              print('网页加载完毕，$value');
          },
          onWebViewCreated: (c) {
            _controller = c;
          },
        ),
      );
  }

  void _navigationGobackAction() {
    _controller.canGoBack().then((value) {
      if (value) {
        _controller.goBack();
      }
      else {
        Navigator.pop(context);
      }
    });
  }

  void _loadwebView() {
    _controller.loadUrl('https://music.163.com');
  }
}