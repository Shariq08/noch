import 'package:get/get.dart';

import '../controllers/about_restaurant_controller.dart';

class AboutRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutRestaurantController>(
      () => AboutRestaurantController(),
    );
  }
}
