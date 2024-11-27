import 'package:get/get.dart';
import 'package:noch/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 1), () => decideRouting());
  }

  decideRouting() async {
    Get.offNamed(Routes.ONBOARDING);
    // Get.offNamed(Routes.ONBOARDING);
  }
}
