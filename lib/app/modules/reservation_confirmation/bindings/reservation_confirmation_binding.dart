import 'package:get/get.dart';

import '../controllers/reservation_confirmation_controller.dart';

class ReservationConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationConfirmationController>(
      () => ReservationConfirmationController(),
    );
  }
}
