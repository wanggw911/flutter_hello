
import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  PageViewPage({Key key}) : super(key: key);

  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView（vertical scroll）'),),
      body: Container(
       child: PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            PageViewContent(index: 1),
            PageViewContent(index: 2),
            PageViewContent(index: 3),
          ],
        ),
      ),
    );
  }
}

class PageViewContent extends StatelessWidget {
  final int index;
  const PageViewContent({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListTile> list = List.generate(10, (index){
      return ListTile(title: Text('$index'),);
    });
    return Container(
        decoration: BoxDecoration(color: index == 1 ? Colors.red:(index == 2 ? Colors.green: Colors.blue)),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      );
  }
}