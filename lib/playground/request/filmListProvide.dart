
import 'package:flutter/cupertino.dart';
import 'package:flutter_hello/playground/request/httpUse.dart';
import 'package:flutter_hello/playground/request/httpUseModel.dart';

class CourseProvide with ChangeNotifier {
  int courseIndex = 1;
  List<Course> courseList = [];

  //加载课程列表
  Future loadCourseList(bool isRefresh) async {
    if (isRefresh) {
      courseList.clear();
      courseIndex = 1;
    }
    else {
      courseIndex++;
    }

    await Network.request(courseIndex).then((value){
      HttpData httpData = value;
      courseList.addAll(httpData.data.datas);

      notifyListeners();
    });
  }

  void modifyCourseWith(int index) {
    Course course = courseList[index];
    course.isSelect = course.isSelect;

    notifyListeners();
  }

  void removeAll() {
    courseList.clear();
    print('所有数据移除完毕。。。');
  }

}