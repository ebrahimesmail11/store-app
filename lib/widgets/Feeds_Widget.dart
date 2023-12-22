import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/consts/global_colors.dart';
import 'package:store_app_api/models/products_model.dart';
import 'package:store_app_api/screens/product_details.dart';



class FeedsWidget extends StatelessWidget {
  const FeedsWidget({super.key});
//  final String title;
// final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productModelProvider=Provider.of<ProductModel>(context);
    return  SizedBox(
      width: size.width*0.2,
      child: Padding(
          padding: EdgeInsets.all(2),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: (){
              Navigator.push(context, PageTransition(child: ProductDetails(id: productModelProvider.id.toString()), type: PageTransitionType.fade),);
            },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5,top: 8,right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: RichText(
                                text: TextSpan(
                                  text: "\$",
                                  style: TextStyle(
                                    color: Color.fromRGBO(33, 150, 243, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "${productModelProvider.price}",
                                      style: TextStyle(
                                        color: lightTextColor,
                                      ),
                                    ),
                                  ]
                                ),
                            ),
                        ),
                        Icon(IconlyBold.heart),
                      ],
                    ),
                  ),
                  SizedBox(height: 18,),
                  ClipRRect(
                    child: FancyShimmerImage(
                      height: size.height*0.2,
                      width: double.infinity,
                      errorWidget: Icon(IconlyBold.danger,size: 28,color: Colors.red,),
                      imageUrl: productModelProvider.images![0],
                      boxFit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productModelProvider.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.01,),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
