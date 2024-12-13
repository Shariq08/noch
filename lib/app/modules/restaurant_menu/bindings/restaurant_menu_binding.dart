import 'package:get/get.dart';

import '../controllers/restaurant_menu_controller.dart';

class RestaurantMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantMenuController>(
      () => RestaurantMenuController(),
    );
  }
}
