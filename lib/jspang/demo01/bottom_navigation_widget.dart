import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/demo01/tabbar_airplay_page.dart';
import 'package:flutter_hello/jspang/demo01/tabbar_email_page.dart';
import 'package:flutter_hello/jspang/demo01/tabbar_home_page.dart';
import 'package:flutter_hello/jspang/demo01/tabbar_pages_page.dart';

class Demo01 extends StatelessWidget {
  const Demo01({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),
      home: BottomnavigationWidget(),
    );
  }
}

class BottomnavigationWidget extends StatefulWidget {
  BottomnavigationWidget({Key key}) : super(key: key);

  _BottomnavigationWidgetState createState() => _BottomnavigationWidgetState();
}

class _BottomnavigationWidgetState extends State<BottomnavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list   
    ..add(HomeScreen())
    ..add(EmailScreen())
    ..add(PagesScreen())
    ..add(AirplayScreen());
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             icon: Icon(
               Icons.home,
               color: _bottomNavigationColor,
             ),
             title: Text(
               'Home',
               style: TextStyle(color: _bottomNavigationColor),
             ),
           ),
           BottomNavigationBarItem(
             icon: Icon(
               Icons.email,
               color: _bottomNavigationColor,
             ),
             title: Text(
               'Email',
               style: TextStyle(color: _bottomNavigationColor),
             ),
           ),
           BottomNavigationBarItem(
             icon: Icon(
               Icons.pages,
               color: _bottomNavigationColor,
             ),
             title: Text(
               'Pages',
               style: TextStyle(color: _bottomNavigationColor),
             ),
           ),
           BottomNavigationBarItem(
             icon: Icon(
               Icons.airplay,
               color: _bottomNavigationColor,
             ),
             title: Text(
               'Airplay',
               style: TextStyle(color: _bottomNavigationColor),
             ),
           ),
         ],
         currentIndex: _currentIndex,
         onTap: (int index) {
           setState(() {
             _currentIndex = index;
           });
         },
         type: BottomNavigationBarType.fixed,
       ),
    );
  }
}

