import 'dart:convert';

import 'package:store_app_api/consts/api_consts.dart';
import 'package:store_app_api/models/catogries_model.dart';
import 'package:store_app_api/models/products_model.dart';

import 'package:http/http.dart' as http;
import 'package:store_app_api/models/user_model.dart';


class ApiStore{

  Future<List<dynamic>>getAllData({required String target})async{
    try{
      var uri=Uri.https(Base_Url,"api/v1/$target",);
      var response=await http.get(uri);
      var data=jsonDecode(response.body);
      List tempList=[];
      if(response.statusCode!=200){
        throw data["message"];
      }
      for(var value in data){
        tempList.add(value);
      }
      return tempList;
    }catch(e){
      throw e.toString();
    }
  }

   Future<List<ProductModel>>getProductStore()async{
  List temp=await getAllData(target: "products");
    return ProductModel.productFromSnapShot(temp);
  }

  Future<List<CategoriesModel>>getCatogriesStore()async{
    List temp= await getAllData(target: "categories");
    return CategoriesModel.catogriesFromSnapShot(temp);
  }
  
  
  Future<List<UserModel>>getUsetStore()async{
    List temp=await getAllData(target: "users");
    return  UserModel.getUserFromSnapShot(temp);
  }

    Future<ProductModel>getProductId({required String id})async{
     try{
       var uri=Uri.https(Base_Url,"api/v1/products/$id",);
       var response=await http.get(uri);
       var data=jsonDecode(response.body);
       if(response.statusCode!=200){
         throw data["message"];
       }
       return ProductModel.fromJson(data);
     }catch(e){
       throw e.toString();
     }
   }
}
//return UserModel.getUserFromSnapShot(tempList);
//categories
//users