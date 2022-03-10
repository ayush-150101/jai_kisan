import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jai_kisan/controllers/item_list_controller.dart';
import 'package:jai_kisan/models/language.dart';
import 'package:get/get.dart';

import 'item_view_screen.dart';

class ItemListScreen extends StatefulWidget {
  String farmingCategory;
  String productCategory;
  String phoneNumber;
  ItemListScreen({Key? key,required this.farmingCategory,required this.productCategory,required this.phoneNumber}) : super(key: key);

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  Widget featureTile(String s, IconData ic, Color c) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: c,
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  s,
                  style: GoogleFonts.roboto(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  ic,
                  color: Colors.black.withOpacity(0.5),
                  size: 22,
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        ItemController(farmingCategory: widget.farmingCategory, productCategory: widget.productCategory));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1AAD9E),
          title: Text(
            widget.farmingCategory,
            //'Farming',
            style: TextStyle(letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ItemController>(
          //init: ProductCategoryController(farmingCategory: widget.farmingCategory),
            builder: (context) {
              return controller.itemsOnDisplay.isNotEmpty?
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                itemCount: controller.itemsOnDisplay.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: InkWell(
                      onTap: () => Get.to(ItemView(
                          item: controller.itemsOnDisplay[index],
                      phoneNumber: widget.phoneNumber,),),
                      child: Material(
                        elevation: 10,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.8),
                                  offset: const Offset(-5.0, -5.0),
                                  blurRadius: 10.0,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(5.0, 5.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.all(Radius.circular(20))),
                          child: Stack(
                            children: [
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    controller.itemsOnDisplay[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(

                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text(controller.itemsOnDisplay[index].name,style: const TextStyle(color: Colors.white,fontSize: 14,letterSpacing: 2),maxLines: 1,)),
                                      Text("₹${controller.itemsOnDisplay[index].price}",style: const TextStyle(color: Colors.white,fontSize: 14,letterSpacing: 2)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40),
              ):Image.asset(
                'assets/coming_soon.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,);
            }));
  }
}
