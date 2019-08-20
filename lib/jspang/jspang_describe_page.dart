
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutJSPangPage extends StatefulWidget {
  AboutJSPangPage({Key key}) : super(key: key);

  _AboutJSPangPageState createState() => _AboutJSPangPageState();
}

class _AboutJSPangPageState extends State<AboutJSPangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('关于技术胖'),),
       body: _content(),
    );
  }

  Widget _content() {
    return Container(
      child: WebView(
        initialUrl: 'https://jspang.com/posts/2019/02/22/flutterdemo.html',
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String value) {
            print('页面加载完毕调用, $value');
        },
      ),
    );
  }
}