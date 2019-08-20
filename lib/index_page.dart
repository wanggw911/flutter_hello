
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/jspang/jspang_list_page.dart';
import 'package:flutter_hello/plugins/plugin_list_page.dart';
import 'package:flutter_hello/widget/widget_list_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var _tabIndex = 0;
  PageController _pageController;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.car),
      title: Text("jspang")
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.car_detailed),
      title: Text("plugins")
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.train_style_one),
      title: Text("widget")
    ),
  ];

  final List<Widget> _tabPagess = [
    JSPangLearnListPage(),
    PluginListPage(),
    WidgetListPage(),
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