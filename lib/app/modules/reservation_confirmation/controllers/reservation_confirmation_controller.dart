import 'package:get/get.dart';
import 'package:noch/app/modules/navigation/controllers/navigation_controller.dart';

class ReservationConfirmationController extends GetxController {
  //TODO: Implement ReservationConfirmationController
  final navigationController = Get.find<NavigationController>();
  void goToHome() {
    navigationController.changePage(0);
    navigationController.resetController();
    Get.offNamed('/navigation');
  }
}
