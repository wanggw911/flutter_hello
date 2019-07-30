import 'package:flutter_hello/playground/request/data.dart';
import 'package:flutter_hello/playground/request/engine.dart';
import 'package:flutter_hello/playground/request/model.dart';
import 'dart:convert'; //json.decode 需要导入这个包

class TestRequest {

  static void request() async {
    //var requestData = getFilmList();

    var paramters = {'start' : 0, 'count' : 1};
    getFilmList(paramters).then((value) {
      
      //这个接口返回的数据，不需要解码，我的神呐😂
      // print("---$value---");
      // String jsonString = value.toString();
      // print("---$jsonString---");
      // var data = json.decode(jsonString);
      // FilmData filmData = FilmData.fromJson(data);
      
      FilmData filmData = FilmData.fromJson(value);
      filmData.subjects.forEach((film) {
        print("-----电影的名字是：${film.title}");
      });
    });
  }

  static void decode() {
    var data = filmMap;
    FilmData filmData = FilmData.fromJson(data);
      filmData.subjects.forEach((film) {
        print("电影的名字是：${film.title}");
    });
  }
}