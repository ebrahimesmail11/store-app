import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/consts/global_colors.dart';
import 'package:store_app_api/models/user_model.dart';


class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final UserModel userModelProvider=Provider.of<UserModel>(context);
    return ListTile(
        leading: FancyShimmerImage(
          width: size.width*0.15,
          height: size.width*0.15,
          errorWidget: Icon(IconlyBold.danger,color: Colors.red,size: 28,),
          imageUrl: userModelProvider.avatar.toString(),
          boxFit: BoxFit.fill,
        ),
        title: Text(userModelProvider.name.toString()),
        subtitle: Text(userModelProvider.email.toString(),),
        trailing: Text(userModelProvider.role.toString(),style: TextStyle(color: lightIconsColor,fontWeight: FontWeight.bold),),
      );
  }
}
