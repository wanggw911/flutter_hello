
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_hello/playground/request/engine.dart';
import 'package:flutter_hello/playground/request/httpUse.dart';
import 'package:flutter_hello/playground/request/httpUseModel.dart';
import 'package:flutter_hello/playground/request/model.dart';

class FilmListPage extends StatefulWidget {
  FilmListPage({Key key}) : super(key: key);

  _FilmListPageState createState() => _FilmListPageState();
}

class _FilmListPageState extends State<FilmListPage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  int start = 0;  
  int count = 10;
  List<Film> list = [];

  int courceIndex = 1;
  List<Course> listOfCourse = [];

  void _refreshData() async {
    list.clear();
    start = 0;
    count = 10;

    listOfCourse.clear();
    courceIndex = 1;
    _requestData();
  }

  void _loadMoreData() async {
    start += 10;
    count += 10;

    courceIndex += 1;
    _requestData();
  }
  
  void _requestData() {
    print("开始请求接口");
    Network.request(courceIndex).then((value){
      HttpData httpData = value;
      setState(() {
        listOfCourse.addAll(httpData.data.datas);
      });
    });  

    // var paramters = {'start' : start, 'count' : 10};
    // getFilmList(paramters).then((value) {
    //   List<Film> filmList = [];
    //   if (value != null) {
    //     FilmData filmData = FilmData.fromJson(value);
    //     filmList = filmData.subjects;
    //   }
    //   setState(() {
    //     list.addAll(filmList);
    //   });
    // });
  }

  @override
  void initState() {
    super.initState();

    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('项目列表'),),
       body: Container(
         child: EasyRefresh(
           key: _easyRefreshKey,
           child: ListView.builder(
             itemCount: listOfCourse.length,
             itemBuilder: (context, index) {
               return _courseCell(context, listOfCourse[index]);
               //Film film = list[index];
               //return _filmCell(context, film);
               //return ListTile(title: Text(film.title),);
             },
           ),
           onRefresh: () async {
             _refreshData();
           },
           loadMore: () async {
             _loadMoreData();
           },
         ),
       ),
    );
  }

  Widget _courseCell(BuildContext context, Course course) {
    return Container(
      height: 150,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            height: 150,
            //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
            //child: Image.network('${film.images.medium}'),
            child: Image.network('${course.envelopePic}'),
          ),
          Container(
            //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
            width: MediaQuery.of(context).size.width - 100,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //控制子元素对齐方式
              children: <Widget>[
                Text(
                  '${course.title}', 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('作者：${course.author}'),
                Text('描述：${course.desc}', maxLines: 3, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Expanded(
            child: Padding(child: Container(), padding: EdgeInsets.all(1.0),),
          ),
        ],
      ),
    );
  }

  Widget _filmCell(BuildContext context, Film film) {
    Directors director = film.directors.first;
    Casts casts = film.casts.first;
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            height: 150,
            //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
            //child: Image.network('${film.images.medium}'),
            child: Text('${film.images.medium}'),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //控制子元素对齐方式
              children: <Widget>[
                Text('${film.title}'),
                Text('导演：${director.name}'),
                Text('主演：${casts.name}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}