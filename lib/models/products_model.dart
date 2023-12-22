
import 'package:flutter/material.dart';
import 'package:store_app_api/models/catogries_model.dart';


class ProductModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  CategoriesModel? category;
  List<String>? images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images
  });
   ProductModel.fromJson(json){
     id=json['id'];
     title=json['title'];
     price=json['price'];
     description=json['description'];
     category=json["category"] !=null ?
     CategoriesModel.fromJson(json['category']):
         null;
     images=json['images'].cast<String>();
   }
   static List<ProductModel> productFromSnapShot(List productsnapShot){
     return productsnapShot.map((data) => ProductModel.fromJson(data)).toList();
   }


}