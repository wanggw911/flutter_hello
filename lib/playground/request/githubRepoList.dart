import 'package:flutter/material.dart';
import 'package:flutter_hello/playground/request/engine.dart';
import 'package:flutter_hello/playground/request/httpUse.dart';
import 'package:flutter_hello/playground/request/httpUseModel.dart';

class GithubRepoPage extends StatefulWidget {
  GithubRepoPage({Key key}) : super(key: key);

  _GithubRepoPageState createState() => _GithubRepoPageState();
}

class _GithubRepoPageState extends State<GithubRepoPage> {
  List<Course> list = [];

  void _loadData() async {
    list.clear();
    print("开始请求接口");
    Network.request(1).then((value){
      HttpData httpData = value;
      list.addAll(httpData.data.datas);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人仓库列表'),),
      body: _pageBody(),
    );
  }

  Widget _pageBody() {
    return Container(
      child: RaisedButton(
        onPressed: _loadData,
        child: Text('请求'),
      ),
    );
  }
}