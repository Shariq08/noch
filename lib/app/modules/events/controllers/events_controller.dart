import 'package:get/get.dart';
import 'package:noch/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:noch/app/routes/app_pages.dart';

class EventsController extends GetxController {
  var isInterested = false.obs;
  var partySize = 1.obs;
  var isPartySizeVisible = false.obs;
  final navigationController = Get.find<NavigationController>();
  void goToHome() {
    navigationController.changePage(0);
    navigationController.resetController();
    Get.offNamed(Routes.NAVIGATION);
  }

  void toggleInterest() {
    isInterested.value = true;
    isPartySizeVisible.value = true;
  }

  void incrementPartySize() {
    partySize.value++;
  }

  void decrementPartySize() {
    if (partySize.value > 1) {
      partySize.value--;
    }
  }
}
