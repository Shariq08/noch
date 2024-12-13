import 'package:get/get.dart';

import '../controllers/restaurant_review_controller.dart';

class RestaurantReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantReviewController>(
      () => RestaurantReviewController(),
    );
  }
}
