import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jai_kisan/database/order_database_helper.dart';
import 'package:jai_kisan/models/item.dart';
import 'package:get/get.dart';
import 'package:jai_kisan/models/order.dart';
import 'package:jai_kisan/screens/shoppingScreens/farming_selection_screen.dart';

class PlaceOrderScreen extends StatefulWidget {
  final Item item;
  final String phoneNumber;
  const PlaceOrderScreen(
      {Key? key, required this.item, required this.phoneNumber})
      : super(key: key);

  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  double quantity = 1;
  int totalPrice = 0;
  TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Order Details: ',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 22),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.98,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1AAD9E),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 1, 4),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    widget.item.image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(1, 4, 1, 4),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.item.name,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(widget.item.description.description,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 18))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(1, 4, 4, 4),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        DateFormat.MMMEd()
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('₹${widget.item.price}/unit',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 18)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Quantity: ',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 22),
                  ),
                ),
                Slider(
                  max: 100,
                  min: 1,
                  divisions: 100,
                  thumbColor: const Color(0xFFA0FFA1),
                  activeColor: const Color(0xFF1AAD9E),
                  inactiveColor: Colors.white,
                  value: quantity,
                  onChanged: (saturation) {
                    setState(() {
                      quantity = saturation;
                      totalPrice = widget.item.price * quantity.toInt();
                    });
                  },
                ),
                Center(
                  child: Text(
                    quantity.toInt().toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "Total Price:   ₹ $totalPrice.00",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //color: Colors.white,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Color(0xFF1AAD9E).withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 2, 0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _addressKey,
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.done,
                                controller: addressController,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  hintText: "Enter You Address",
                                  //hintStyle: TextStyle(),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (_addressKey.currentState!.validate()) {
                        OrderDataBaseHelper.instance.insert(Order(
                            phoneNumber: widget.phoneNumber,
                            itemId: widget.item.itemId,
                            price: widget.item.price,
                            quantity: quantity.toInt(),
                            address: addressController.text));
                        Get.offAll(
                            FarmingSelectionScreen(
                                languageCode: "en",
                                phoneNumber: widget.phoneNumber),
                            transition: Transition.fade,
                            duration: const Duration(seconds: 1));
                      }
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFF1AAD9E).withOpacity(0.7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      var x = await OrderDataBaseHelper.instance.queryAll();
                      for (var element in x)
                        print(
                            "${element.phoneNumber},${element.itemId},${element.price},${element.quantity},${element.address} ");
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFF1AAD9E).withOpacity(0.7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "Show Order",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                color: const Color(0xFF1AAD9E),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () => Get.back(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 38, 0, 0),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black.withOpacity(0.6),
                    size: 18,
                  ),
                ),
              )),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 34, 0, 0),
                child: Text(
                  'Order Details',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 20,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
