

import 'package:flutter/cupertino.dart';

class CategoriesModel with ChangeNotifier{
  int? id;
  String? name;
  String? image;


  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
});


  CategoriesModel.fromJson(json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  static List<CategoriesModel> catogriesFromSnapShot(List catogriesSnapShot){
    return catogriesSnapShot.map((data) => CategoriesModel.fromJson(data)).toList();
  }
}