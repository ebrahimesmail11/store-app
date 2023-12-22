import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/consts/global_colors.dart';
import 'package:store_app_api/models/products_model.dart';
import 'package:store_app_api/screens/Users_Screen.dart';
import 'package:store_app_api/screens/catogries_screen.dart';
import 'package:store_app_api/screens/feeds_screen.dart';
import 'package:store_app_api/services/Api_Store.dart';
import 'package:store_app_api/widgets/AppBar_Icons.dart';
import 'package:store_app_api/widgets/grid_feeds.dart';
import 'package:store_app_api/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  // var future;
  // List<ProductModel> productList=[];
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

// @override
//   void didChangeDependencies() {
//     getProduct();
//     super.didChangeDependencies();
//   }
//   Future<void> getProduct()async {
//     productList= await ApiStore().getProductStore();
//     setState(() {
//
//     });
//   }
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Focus.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: CatogriesScreen(),
                      type: PageTransitionType.fade));
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
                function: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: UsersScreen(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                icon: IconlyBold.user3),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  hintText: 'Search',
                  suffixIcon: Icon(IconlyLight.search, color: lightIconsColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: lightIconsColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .25,
                        child: Swiper(
                            autoplay: true,
                            pagination: SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white, activeColor: Colors.red),
                            ),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return SaleWidget();
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Latest Products",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        child: FeedsScreen(),
                                        type: PageTransitionType.fade),
                                  );
                                },
                                icon: IconlyBold.arrowRight2),
                          ],
                        ),
                      ),
                      FutureBuilder<List<ProductModel>>(
                          future: ApiStore().getProductStore(),
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
                            return GridFeeds(productList: snapShot.data!);
                          }),
                      // productList.isEmpty?Container():GridFeeds(productList: productList),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
