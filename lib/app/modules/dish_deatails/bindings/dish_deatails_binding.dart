import 'package:get/get.dart';

import '../controllers/dish_deatails_controller.dart';

class DishDeatailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DishDeatailsController>(
      () => DishDeatailsController(),
    );
  }
}
