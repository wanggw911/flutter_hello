import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
// import 'package:http/http.dart';

Future getFilmList01() async {
  //原生的网络请求？？？http://www.liulongbin.top:3005/api/v2/movie/top250?start=0&count=10
  var httpClient = new HttpClient();
  var uri = Uri.http('www.liulongbin.top:3005', 'api/v2/movie/top250?start=0&count=1');
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
}

Future getFilmList(Map<String, int> parameters) async {
  try{
    Dio dio = Dio();
    Response response = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/top250', queryParameters: parameters);
    if (response.statusCode == 200) {
      print("请求的地址是：${response.realUri.toString()}");
      //debugPrint("请求到了数据:\n$response");
      return response.data;
    }
    else {
      print('获取不到后台数据');
      Exception('后端接口出现异常');
    }
  } catch(e){
    print('ERROR: === $e');
    return null; 
  }
}

Future getUserRepoList01(String userName) async {
  var httpClient = new HttpClient();
  var uri = Uri.http('http://api.github.com/users/xrd/repos', '');
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
  print(responseBody.toString());
}

Future getUserRepoList(String userName) async {
  try{
    var urlString = 'https://api.github.com/users/xrd/repos';// "https://api.github.com/users/$userName/repos";
    print(urlString);
    Dio dio = Dio();
    Response response = await dio.get(urlString);
    if (response.statusCode == 200) {
      print("请求的地址是：${response.realUri.toString()}");
      return response.data;
    }
    else {
      print('获取不到后台数据');
      Exception('后端接口出现异常');
    }
  } catch(e){
    print('ERROR: === $e');
    return null; 
  }
}

