
import 'package:flutter/material.dart';
import 'package:flutter_hello/plugins/http/http_model.dart';
import 'package:flutter_hello/plugins/http/http_use.dart';
import 'package:flutter_hello/plugins/provide/course_provide.dart';
import 'package:flutter_hello/plugins/request/model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class FilmListPage extends StatefulWidget {
  FilmListPage({Key key}) : super(key: key);

  _FilmListPageState createState() => _FilmListPageState();
}

class _FilmListPageState extends State<FilmListPage> with WidgetsBindingObserver {
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  //GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();
  //EasyRefreshController _controller;

  int start = 0;  
  int count = 10;
  List<Film> list = [];

  int courceIndex = 1;
  List<Course> listOfCourse = [];
  //bool _isFirstInPage = true;
  bool _isHaveMoreData = true; //控制是否可以加载更多

  @override
  void initState() {
    super.initState();

    //_controller = EasyRefreshController();    

    //1、进入界面加载数据，但是没有动画，✅
    //_refreshData();
    //1、进入界面加载数据，但是没有动画，✅，可行但是报警告⚠️
    //_provideRefreshData();
    //2、初始化的时候，直接去call，必定会造成崩溃，因为还没build完成❌
    //_easyRefreshKey.currentState.callRefresh();
    //3、监听每一针绘制完成，然后再调用上面的下拉刷新❌
    // WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    // widgetsBinding.addPersistentFrameCallback((callback) {
    //   print('第一帧完成绘制');
    //   if (_isFirstInPage) {
    //     _isFirstInPage = false;
    //     _easyRefreshKey.currentState.callRefresh();
    //   }
    // });

    WidgetsBinding.instance.addPostFrameCallback((_){
      /// 接口请求
      print("界面完成build。。。。");
      _provideRefreshData();
      //_controller.callRefresh();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('didChangeDependencies执行了。。。');
    //provide 管理数据，初始化请求数据的方法就写在这边
    //_provideRefreshData();
  }

  // @override
  // void dispose() {
  //   print('准备移除所有数据。。。');
  //   //Provide.value<CourseProvide>(context).removeAll();
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('项目列表'),),
       body: Container(
         child: _contentListView(),
       ),
    );
  }

  Widget _contentListView() {
    return Provide<CourseProvide>(builder: (context, child, value) {
      List<Course> _courseList = Provide.value<CourseProvide>(context).courseList;
      return EasyRefresh(
        key: _easyRefreshKey,
        behavior: ScrollOverBehavior(),
        //controller: _controller,
        child: ListView.builder(
          itemCount: _courseList.length,
          itemBuilder: (context, index) {
            return _courseCell(context, _courseList[index]);
          },
        ),
        // footer: Footer(
        //   key: _footerKey,
        //   loadingText: "正在加载数据，请稍等...",
        //   showMore: courceIndex == 2 ? true : false,
        // ),
        onRefresh: () async {
          await _provideRefreshData();
          //await _refreshData();
        },
        loadMore: _isHaveMoreData 
        ? () async {
          await _provideLoadMoreData();
          //await _loadMoreData();
        } : null,
      );
    });
  }

  //课程cell
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

  //电影Cell
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

  Future _provideRefreshData() async {
    print("下拉刷新数据。。。");
    await Provide.value<CourseProvide>(context).loadCourseList(true);
  }

  Future _provideLoadMoreData() async {
    print("上拉加载更多数据。。。");
    await Provide.value<CourseProvide>(context).loadCourseList(false);
  }

  Future _refreshData() async {
    list.clear();
    start = 0;
    count = 10;

    listOfCourse.clear();
    courceIndex = 1;
    await _requestData();

    // _easyRefreshKey.currentState.waitState(() {
    //   setState(() {
    //     _isHaveMoreData = true;  
    //   });
    // });
  }

  Future _loadMoreData() async {
    start += 10;
    count += 10;

    if (courceIndex == 2) {
      // _easyRefreshKey.currentState.waitState(() {
      //   setState(() {
      //     _isHaveMoreData = false;  
      //   });
      // });
    }
    else {
      courceIndex += 1;
      await _requestData();
    }
  }
  
  Future _requestData() async {
    print("开始请求接口");
    await Network.request(courceIndex).then((value){
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
}