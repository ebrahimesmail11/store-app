import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/models/products_model.dart';
import 'package:store_app_api/services/Api_Store.dart';
import 'package:store_app_api/widgets/Feeds_Widget.dart';


class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});
  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}
class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductModel> productList=[];
  @override
  void didChangeDependencies() {
    getProduct();
    super.didChangeDependencies();
  }
  Future<void> getProduct()async {
    productList= await ApiStore().getProductStore();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: productList.isEmpty? Center(
        child: CircularProgressIndicator(),
      ):GridView.builder(
        itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context,index){
            return ChangeNotifierProvider.value(
              value: productList[index],
              child: FeedsWidget(

              ),
            );
          }
      ),
    );
  }
}
