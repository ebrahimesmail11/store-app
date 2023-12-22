import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier{
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
});

  UserModel.fromJson(json){
    id=json['id'];
    email=json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }
  static List<UserModel>getUserFromSnapShot(List UserSnapShot){
    return UserSnapShot.map((data) => UserModel.fromJson(data)).toList();
  }
}