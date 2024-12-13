import 'package:get/get.dart';

import '../controllers/share_followers_controller.dart';

class ShareFollowersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareFollowersController>(
      () => ShareFollowersController(),
    );
  }
}
