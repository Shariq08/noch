import 'package:get/get.dart';

import '../controllers/gathering_controller.dart';

class GatheringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GatheringController>(
      () => GatheringController(),
    );
  }
}
