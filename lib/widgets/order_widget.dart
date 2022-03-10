import 'package:flutter/material.dart';
import 'package:jai_kisan/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({Key? key,required this.order}) : super(key: key);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
