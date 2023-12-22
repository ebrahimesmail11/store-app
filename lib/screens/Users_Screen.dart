import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/models/user_model.dart';
import 'package:store_app_api/services/Api_Store.dart';
import 'package:store_app_api/widgets/user_widget.dart';



class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body:  FutureBuilder<List<UserModel>>(
          future: ApiStore().getUsetStore(),
          builder: (context, snapShot) {
            if (snapShot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapShot.hasError) {
              return Text("An error occured${snapShot.error}");
            } else if (snapShot.hasData == null) {
              return Center(
                child: Text("No Product has been added yet"),
              );
            }
            return ListView.builder(
                itemCount: snapShot.data!.length,
                itemBuilder: (context,index){
              return ChangeNotifierProvider.value(
                value: snapShot.data![index],
                  child: UsersWidget(),
              );
            },
 );
          }),
    );
  }
}
// ListView.builder(
// itemCount: 10,
// itemBuilder: (context,index){
// return UsersWidget();
// },
// // ),