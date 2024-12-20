import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsGatheringsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: Get.arguments?['selectedTab'] ?? 0,
    );
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
