class Course {
  String? courseName;
  int? price;

  Course({this.courseName, this.price});

  Course.fromJson(Map<String, dynamic> json) {
    courseName = json['courseName'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseName'] = courseName;
    data['price'] = price;
    return data;
  }
}
