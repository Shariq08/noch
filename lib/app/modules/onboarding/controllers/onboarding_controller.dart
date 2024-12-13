import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  final currentIndex = 0.obs;
  late PageController pageController = PageController(initialPage: 0);

  // Onboarding data
  final List<Map<String, String>> data = [
    {
      "img": ImageConstant.onboarding_1,
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "desc":
          "Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
    },
    {
      "img": ImageConstant.onboarding_2,
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "desc":
          "Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
    },
    {
      "img": ImageConstant.onboarding_3,
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "desc":
          "Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
    },
    {
      "img": ImageConstant.onboarding_4,
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "desc":
          "Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
    },
  ];

  @override
  void onInit() {
    super.onInit();
    for (var item in data) {
      precacheImage(AssetImage(item['img']!), Get.context!);
    }
    pageController = PageController(initialPage: 0);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void goToNextPage() {
    if (currentIndex.value < data.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
