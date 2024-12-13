import 'package:get/get.dart';

class RestaurantDetailsController extends GetxController {
  RxBool isIgnore = true.obs;
  RxBool isCalendarDialog = false.obs;
  final currentIndex = 0.obs;
  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void toggleIgnore() {
    isIgnore.value = !isIgnore.value;
  }

  void toggleCalendarDialog() {
    print("uuuuu");
    isCalendarDialog.value = !isCalendarDialog.value;
  }

  final count = 0.obs;

  void increment() => count.value++;
}
