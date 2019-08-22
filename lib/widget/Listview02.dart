
import 'package:flutter/material.dart';

/*
问题：Flutter核心技术与实战，第15课的问题
1、如何获取字符串的长度？然后来控制 more button 的显示与隐藏
*/

class News {
  String title;
  String subTitle;
  bool isShowAll;

  News({this.title, this.subTitle, this.isShowAll = false});
}

class ListviewMoreDemoPage extends StatefulWidget {
  ListviewMoreDemoPage({Key key}) : super(key: key);

  _ListviewMoreDemoPageState createState() => _ListviewMoreDemoPageState();
}

class _ListviewMoreDemoPageState extends State<ListviewMoreDemoPage> {
  List<News> newsList = [];

  @override
  void initState() {
    super.initState();

    _configNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Cell More Button'),),
       body: _content(),
    );
  }

  Widget _content() {
    return Container(
      child: ListView.separated(
        itemCount: newsList.length,
        separatorBuilder: (context, index) {
          return Divider(height: 0.5, color: Colors.grey.shade200);
        },
        itemBuilder: (context, index) {
          News news = newsList[index];
          return _listCell(news);
        },
      ),
    );
  }

  Widget _listCell(News news) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${news.title}',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Container(
            //decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.red)), //use for debug frame
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Stack(
              children: <Widget>[
                Text(
                  '${news.subTitle}',
                  maxLines: news.isShowAll ? null : 2,
                ),
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: Opacity(
                    opacity: news.isShowAll ? 0 : 1.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        //border: Border.all(width: 0.5, color: Colors.red), //use for debug frame
                        color: Colors.white
                      ), 
                      child: InkWell(
                        child: Text('More', style: TextStyle(color: Colors.blue),),
                        onTap: () {
                          setState(() {
                            news.isShowAll = !news.isShowAll;
                          });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _configNewsData() {
    List<News> list = [
      News(title: "News 1", subTitle: "this is news subtitle"),
      News(title: "News 2", subTitle: "this is news subtitle this is news subtitle this is news subtitle"),
      News(title: "News 3", subTitle: "this is news subtitle this is news subtitle this is news subtitle this is news subtitle this is news subtitle this is news subtitle"),
      News(title: "News 4", subTitle: "this is news subtitle this is news subtitle this is news subtitle this is news subtitle this is news subtitle this is news subtitle this is news subtitle this is news subtitle this is news subtitle"),
      ];

    setState(() {
      newsList.addAll(list);
    });
  }
}