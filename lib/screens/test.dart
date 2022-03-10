import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:jai_kisan/models/item.dart';
import 'package:jai_kisan/models/product_description.dart';
import 'package:jai_kisan/screens/orderScreens/place_order_screen.dart';
import 'package:jai_kisan/screens/shoppingScreens/item_view_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  void initState(){
    super.initState();
   /* Get.to(PlaceOrderScreen(item:Item(
        itemId: 8,
        name: "Pawda",
        farmingCategory: 'Tea',
        productCategory: 'Equipments',
        price: 1300,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "*************** Product Description ****************",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),));*/
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("hello"),),
    );
  }
}
