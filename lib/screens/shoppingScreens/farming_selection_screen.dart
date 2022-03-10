import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jai_kisan/controllers/farming_selection_controller.dart';
import 'package:jai_kisan/models/language.dart';
import 'package:jai_kisan/screens/shoppingScreens/product_category_screen.dart';
import 'package:jai_kisan/screens/userProfileScreens/user_profile_screen.dart';

class FarmingSelectionScreen extends StatefulWidget {
  String languageCode;
  String phoneNumber;
  FarmingSelectionScreen(
      {Key? key, required this.languageCode, required this.phoneNumber})
      : super(key: key);

  @override
  _FarmingSelectionScreenState createState() => _FarmingSelectionScreenState();
}

class _FarmingSelectionScreenState extends State<FarmingSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(FarmingController(languageCode: widget.languageCode));
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () => Get.to(const UserProfileScreen()),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
            ),
          ],
          backgroundColor: const Color(0xFF1AAD9E),
          title: Text(
            Language.translator("Farming", widget.languageCode),
            //'Farming',
            style: const TextStyle(letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<FarmingController>(
            init: FarmingController(languageCode: widget.languageCode),
            builder: (context) {
              return GridView.builder(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                  itemCount: controller.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 40),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.to(ProductCategoryScreen(
                        farmingCategory: controller.categories[index].category,
                        phoneNumber: widget.phoneNumber,
                      )),
                      child: Material(
                        elevation: 10,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Stack(
                            children: [
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.asset(
                                    controller.categories[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Language.translator(
                                        controller.categories[index].category,
                                        widget.languageCode),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }
}
