import 'package:get/get.dart';

import '../controllers/restaurant_photos_controller.dart';

class RestaurantPhotosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantPhotosController>(
      () => RestaurantPhotosController(),
    );
  }
}
