import 'dart:convert';

import 'model/User.dart';

void main() {
  //一个JSON格式的用户列表字符串
  String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
  //将JSON字符串转为Dart对象(此处是List)
  List items = json.decode(jsonStr);
  //输出第一个用户的姓名
  print(items[0]["name"]);

  String json1 = """
  {
    "name": "John Smith",
    "email": "john@example.com"
  }
  """;

  Map<String, dynamic> user = json.decode(json1);

  print('Howdy, ${user['name']}!');
  print('We sent the verification link to ${user['email']}.');

  Map userMap = json.decode(json1);

  User userModel = User.fromJson(userMap);
  print('Howdy, ${userModel.name}!');
  print('We sent the verification link to ${userModel.email}.');

  print('serilize= ' + json.encode(userModel));
}

