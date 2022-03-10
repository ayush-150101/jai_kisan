import 'package:get/get.dart';
import 'package:jai_kisan/models/farming_category.dart';
import 'package:jai_kisan/models/language.dart';

class FarmingController extends GetxController {

  String languageCode;
  FarmingController({required this.languageCode});

  static String s = "";

  @override
  void onInit() {
    super.onInit();
    s = languageCode;
  }

  final List<FarmingCategory> categories = [
    FarmingCategory(
        image:
            "assets/rice.jpeg",
        category: "Rice",),
    FarmingCategory(
        image:
            "assets/wheat.jpeg",
        category: "Wheat"),
    FarmingCategory(
        image:
            "assets/tea.jpeg",
        category: "Tea"),
    FarmingCategory(
        image:
            "assets/mustard.jpeg",
        category: "Mustard")
  ];
}
