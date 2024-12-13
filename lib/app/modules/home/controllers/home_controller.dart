import 'package:get/get.dart';

class HomeController extends GetxController {
  var isSwitchedOn = false.obs;
  var isliked = false.obs;
  var isCommentVisible = false.obs;
  var isNotificationVisible = false.obs;
  void toggleCommentVisibility() {
    isCommentVisible.value = !isCommentVisible.value;
  }

  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
  }

  void toggleSwitch(bool value) {
    isSwitchedOn.value = value;
  }

  void togglelike() {
    isliked.value = !isliked.value;
  }

  final count = 0.obs;

  void increment() => count.value++;
}
