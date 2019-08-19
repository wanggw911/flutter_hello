import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunchPage extends StatefulWidget {
  UrlLaunchPage({Key key}) : super(key: key);

  _UrlLaunchPageState createState() => _UrlLaunchPageState();
}

class _UrlLaunchPageState extends State<UrlLaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("urlLaunch使用"),),
      body: Container(
       child: Center(
         child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Show Flutter homepage'),
        ),
       ),
    ),
    );
  }

  ///url_launcher，使用了另外一个窗口来展示网页内容
  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      print('canLaunch $url');
      await launch(url);
    } else {
      print('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}