import 'package:get/get.dart';
import 'package:jai_kisan/database/order_database_helper.dart';
import 'package:jai_kisan/models/order.dart';

class OrderController extends GetxController{

  List<Order> orders = [];
  dynamic databaseFetched = false.obs();

  @override
  onInit(){
    super.onInit();
    getOrderList();
  }

  void getOrderList() async{
    orders = await OrderDataBaseHelper.instance.queryAll();
    databaseFetched = true.obs();
  }

}