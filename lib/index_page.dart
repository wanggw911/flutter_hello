
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/jspang_list_page.dart';
import 'package:flutter_hello/playground/playground_list_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var _tabIndex = 1;
  PageController _pageController;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("jspang")
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text("playground")
    ),
  ];

  final List<Widget> _tabPagess = [
    JSPangLearnListPage(),
    PlaygroundListPage(),
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _tabIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
       bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         currentIndex: _tabIndex,
         items: bottomTabs,
         onTap: (index) {
           setState(() {
            _tabIndex = index;
            _pageController.jumpToPage(index);
           });
         },
       ),
       body: PageView(
         children: _tabPagess,
         controller: _pageController,
         physics: NeverScrollableScrollPhysics(),
       ),
    );
  }
}