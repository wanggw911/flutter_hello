
import 'package:flutter/material.dart';

class BottomAppBarDemo extends StatefulWidget {
  BottomAppBarDemo({Key key}) : super(key: key);

  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
         onPressed: (){

         },
         tooltip: 'Increment',
         child: Icon(
           Icons.add,
            color: Colors.white,
         ),
       ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: (){

                },
              ),
              IconButton(
                icon: Icon(Icons.airplay),
                color: Colors.white,
                onPressed: (){
                    
                },
              ),
            ],
          ),
        ),
    );
  }
}