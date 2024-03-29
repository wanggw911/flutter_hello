
class Student {
  int id;
  String name;
  int age;
  int grade;

  Student({this.id, this.name, this.age, this.grade});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    grade = json['grade'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['grade'] = this.grade;
    return data;
  }
}