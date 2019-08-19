
class Student {
  String name;
  int age;
  int grade;

  Student({this.name, this.age, this.grade});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['grade'] = this.grade;
    return data;
  }
}