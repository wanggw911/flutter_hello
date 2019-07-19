import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
         type: BottomNavigationBarType.fixed,
       ),
    );
  }
}

