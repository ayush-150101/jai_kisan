import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jai_kisan/controllers/order_controller.dart';
import 'package:jai_kisan/screens/userProfileScreens/user_profile_screen.dart';

class ShowOrdersScreen extends StatelessWidget {
  const ShowOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1AAD9E),
        title: const Text(
          'My Orders',
          //'Farming',
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: GetX<OrderController>(builder: (controller){
        return Center(
          child: controller.databaseFetched.value==false?const CircularProgressIndicator():
          ListView.builder(
              itemCount: controller.orders.length,
              itemBuilder: (context,index){
                return Container(

                );
              }),
        );
      },),
    );
  }
}
