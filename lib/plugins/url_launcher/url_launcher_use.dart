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
          child: Column(
            children: <Widget>[
              Container(height: 20),
              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: _launchURLInNewPage,
                  child: Text('show flutter homepage in new webpage'),
                ),
              ),
              Container(height: 20),
              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: _launchURLInSafari,
                  child: Text('show flutter homepage in safari'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURLInNewPage() async {
    //使用了另外一个窗口来展示网页内容
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLInSafari() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}