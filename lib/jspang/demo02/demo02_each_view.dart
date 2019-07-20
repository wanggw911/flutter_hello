
import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  // 变量 _title 不加 final 报警告⚠️
  // This class (or a class which this class inherits from) is marked as '@immutable', 
  // but one or more of its instance fields are not final: EachView._title
  final String _title;          
  EachView(this._title);
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(widget._title)),
       body: Center(child: Text(widget._title)),
    );
  }
}