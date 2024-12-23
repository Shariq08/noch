import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noch/app/modules/home/controllers/home_controller.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    Get.put(HomeController());
  }

  @override
  void onClose() {
    pageController.dispose();

    super.onClose();
  }

  void resetController() {
    if (pageController.hasClients) {
      pageController.dispose();
    }
    pageController = PageController(initialPage: currentIndex.value);
  }

  @override
  void onReady() {
    super.onReady();
    if (!pageController.hasClients) {
      resetController();
    }
  }

  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
    //       pageController.animateToPage(
    //         index,
    //         duration: Duration(milliseconds: 300),
    //         curve: Curves.easeInOut,
    //       );
    //   currentIndex.value = index;
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     if (pageController.hasClients) {
    //       pageController.animateToPage(
    //         index,
    //         duration: Duration(milliseconds: 300),
    //         curve: Curves.easeInOut,
    //       );
    //     } else {
    //       print("PageView is still not attached after frame!");
    //     }
    //   });
  }
}
