import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jai_kisan/controllers/product_category_controller.dart';
import 'package:jai_kisan/screens/shoppingScreens/item_list_screen.dart';

class ProductCategoryScreen extends StatefulWidget {
  final String farmingCategory;
  final String phoneNumber;
  const ProductCategoryScreen({Key? key, required this.farmingCategory,required this.phoneNumber})
      : super(key: key);

  @override
  _ProductCategoryScreenState createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
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
        ProductCategoryController(farmingCategory: widget.farmingCategory));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1AAD9E),
          title: Text(
            widget.farmingCategory,
            //'Farming',
            style: const TextStyle(letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ProductCategoryController>(
            //init: ProductCategoryController(farmingCategory: widget.farmingCategory),
            builder: (context) {
          return controller.viewCategories.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                  itemCount: controller.viewCategories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: InkWell(
                        onTap: () => Get.to(ItemListScreen(
                            farmingCategory: widget.farmingCategory,
                            productCategory: controller.viewCategories[index]['productCategory'],
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
                                      controller.viewCategories[index]["imageName"],
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
                                      child: Text(controller.viewCategories[index]["productCategory"],style: const TextStyle(color: Colors.white,fontSize: 22,letterSpacing: 2),),
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
                )
              : Image.asset(
                  'assets/coming_soon.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
        }));
  }
}
