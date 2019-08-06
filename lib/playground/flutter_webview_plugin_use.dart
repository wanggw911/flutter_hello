

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FlutterWebviewPluginPage extends StatefulWidget {
  FlutterWebviewPluginPage({Key key}) : super(key: key);

  _FlutterWebviewPluginPageState createState() => _FlutterWebviewPluginPageState();
}

class _FlutterWebviewPluginPageState extends State<FlutterWebviewPluginPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
  title: 'Flutter WebView Demo',
  theme: new ThemeData(
    primarySwatch: Colors.blue,
  ),
  routes: {
    //'/': (_) => const MyHomePage(title: 'Flutter WebView Demo'),
    '/widget': (_) => new WebviewScaffold(
      url: 'www.baidu.com',
      appBar: new AppBar(
        title: const Text('Widget webview'),
      ),
      withZoom: true,
      withLocalStorage: true,
    
    ),
  },
);
  }
}


class ArticleDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(
        url:"https://blog.csdn.net/dickyqie",
        // 登录的URL
        appBar: new AppBar(
          title: const Text('Widget webview'),
        ),
        withZoom: true,
        // 允许网页缩放
        withLocalStorage: true,
        // 允许LocalStorage
        withJavascript: true, // 允许执行js代码
      )
    );
  }
}

class WebViewExample extends StatefulWidget {
   @override
   _WebViewExampleState createState() => _WebViewExampleState();
 }
 
 class _WebViewExampleState extends State<WebViewExample> {
   TextEditingController controller = TextEditingController();
   FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
   var urlString = "https://google.com";
 
   launchUrl() {
     setState(() {
       urlString = controller.text;
       flutterWebviewPlugin.reloadUrl(urlString);
     });
   }
 
   @override
   void initState() {
     super.initState();
 
     flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
       print(wvs.type);
     });
   }
 
   @override
   Widget build(BuildContext context) {
     return WebviewScaffold(
       appBar: AppBar(
         title: TextField(
           autofocus: false,
           controller: controller,
           textInputAction: TextInputAction.go,
           onSubmitted: (url) => launchUrl(),
           style: TextStyle(color: Colors.white),
           decoration: InputDecoration(
             border: InputBorder.none,
             hintText: "Enter Url Here",
             hintStyle: TextStyle(color: Colors.white),
           ),
         ),
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.navigate_next),
             onPressed: () => launchUrl(),
           )
         ],
       ),
       url: urlString,
       withZoom: false,
     );
   }
 }
