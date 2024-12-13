import 'package:get/get.dart';

import '../controllers/ride_request_controller.dart';

class RideRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RideRequestController>(
      () => RideRequestController(),
    );
  }
}
