import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app_api/consts/global_colors.dart';
import 'package:store_app_api/models/products_model.dart';
import 'package:store_app_api/services/Api_Store.dart';



class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key,required this.id});
  final String id;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductModel? productModel;
  Future<void>getProductDetails()async{
    productModel=await ApiStore().getProductId(id: widget.id);
    setState(() {

    });
  }
  @override
  void didChangeDependencies() {
    getProductDetails();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: productModel==null?Center(child: CircularProgressIndicator()):SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18,),
              BackButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       productModel!.category!.name.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            productModel!.title.toString(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        RichText(
                            text: TextSpan(
                              text: "\$",
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(
                                      33, 150, 243, 1)),
                              children: [
                                TextSpan(
                                  text: productModel!.price.toString(),
                                style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight:
                                    FontWeight.bold),
                                ),
                              ]
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.4,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return FancyShimmerImage(
                        imageUrl: productModel!.images![index].toString(),
                      width: double.infinity,
                      boxFit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 18,),
                    Text(
                      productModel!.description.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
