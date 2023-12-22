import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/models/products_model.dart';
import 'package:store_app_api/widgets/Feeds_Widget.dart';



class GridFeeds extends StatelessWidget {
  const GridFeeds({super.key,required this.productList});
  final List<ProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
       shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context,index){
          return ChangeNotifierProvider.value(
            value: productList[index],
            child: const  FeedsWidget(),
          );
        }
    );
  }
}
