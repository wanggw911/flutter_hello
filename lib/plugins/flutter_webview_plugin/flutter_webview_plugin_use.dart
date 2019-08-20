

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FlutterWebviewPluginPage extends StatefulWidget {
  FlutterWebviewPluginPage({Key key}) : super(key: key);

  _FlutterWebviewPluginPageState createState() => _FlutterWebviewPluginPageState();
}

class _FlutterWebviewPluginPageState extends State<FlutterWebviewPluginPage> {
  /* 
  [【Flutter学习】基本组件之Webview组件](https://www.cnblogs.com/lxlx1798/p/11371209.html)
  webview并不存在于widget树中，所以你不能在webview中使用如snackbars, dialogs ...
  ⚠️：好像没找到 cangoback 的API
  */
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  
  @override
  void initState() {
    super.initState();

    _listenWebLoadState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('flutter_webview_plugin usage'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: _navigationGobackAction,
        ),
      ),
      url: "https://www.baidu.com",
      scrollBar: true,
      withZoom: true, // 允许网页缩放
      withLocalStorage: true, // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }

  void _listenWebLoadState() {
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged webViewState) async {
      switch (webViewState.type) {
        case WebViewState.shouldStart:
          print('WebViewState.shouldStart');
          break;
        case WebViewState.startLoad:
          print('WebViewState.startLoad');
          break;
        case WebViewState.finishLoad:
          print('WebViewState.finishLoad');
          break;
        case WebViewState.abortLoad:
          print('WebViewState.abortLoad');
          break;
      }
    });
  }

  void _webviewReload() {
    flutterWebviewPlugin.reload();
  }

  void _navigationGobackAction() {
    //flutterWebviewPlugin.goBack();
    Navigator.pop(context);
  }
}