import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter_hello/plugins/http/http_model.dart';

class Network {
  static Future request(int index) async {
    var client = http.Client();
    http.Response response = await client.get('https://www.wanandroid.com/project/list/$index/json?cid=1');
    print("response.statusCode = ${response.statusCode}");
    var jsonString = json.decode(response.body);
    if (response.statusCode == 200) {
      HttpData httpData = HttpData.fromJson(jsonString);
      httpData.data.datas.forEach((item) {
        //print("作者：${item.author}");
      });
      return httpData;
    }
    else {
      return null;
    }
  }
}