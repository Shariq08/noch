import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();

    super.onClose();
  }

  void resetController() {
    pageController.dispose();
    pageController = PageController(initialPage: currentIndex.value);
  }

  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
