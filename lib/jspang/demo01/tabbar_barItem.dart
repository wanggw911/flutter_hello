
//import 'package:flutter/material.dart';


// 不是一个 widget，所以还不能用下面的方式来自定义：
// BottomNavigationBarItem 是一个类，


// class MyBarItem extends BottomNavigationBarItem {
//   const MyBarItem({Key key, this.myIndex, this.selectIndex}) : super(key: key);

//   final _normalColor = Colors.blue;
//   final _selectColor = Colors.red;

//   final int myIndex;
//   final int selectIndex;

//   Color _tabbarColor() {
//     return myIndex == selectIndex ? _selectColor : _normalColor;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBarItem(
//              icon: Icon(
//                Icons.pages,
//                color: _tabbarColor(),
//              ),
//              title: Text(
//                'Pages',
//                style: TextStyle(color: _tabbarColor()),
//              ),
//            );
//   }
// }