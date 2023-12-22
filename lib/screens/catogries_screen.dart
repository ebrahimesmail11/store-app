import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store_app_api/models/catogries_model.dart';
import 'package:store_app_api/services/Api_Store.dart';
import 'package:store_app_api/widgets/Catogry_Widget.dart';



class CatogriesScreen extends StatelessWidget {
  const CatogriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catogries"),
      ),
      body:  FutureBuilder<List<CategoriesModel>>(
          future:  ApiStore().getCatogriesStore(),
          builder: (context,snapShot){
            if(snapShot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapShot.hasError){
              return Text("An error occured${snapShot.error}");
            }else if(snapShot.hasData == null){
              return Center(
                child: Text("No Product has been added yet"),
              );
            }
            return GridView.builder(
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: snapShot.data![index],
                    child: CatogryWidget(),
                );
              },
            );
          }
      ),

      // ),
    );
  }
}
// GridView.builder(
// itemCount: 6,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 0.0,
// crossAxisSpacing: 0.0,
// childAspectRatio: 1.2,
// ),
// itemBuilder: (context, index) {
// return CatogryWidget();
// },
// );