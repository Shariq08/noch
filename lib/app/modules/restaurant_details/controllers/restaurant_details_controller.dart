import 'package:get/get.dart';
import 'package:noch/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:noch/app/routes/app_pages.dart';

class RestaurantDetailsController extends GetxController {
  RxBool isIgnore = true.obs;
  RxBool isCalendarDialog = false.obs;
  final currentIndex = 0.obs;
  final navigationController = Get.find<NavigationController>();

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void toggleIgnore() {
    isIgnore.value = !isIgnore.value;
  }

  void toggleCalendarDialog() {
    isCalendarDialog.value = !isCalendarDialog.value;
  }

  void goToRestaurantList() {
    navigationController.changePage(2);
    navigationController.resetController();
    Get.offNamed(Routes.NAVIGATION);
  }

  final count = 0.obs;

  void increment() => count.value++;
}
