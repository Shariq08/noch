import 'package:get/get.dart';

class GatheringController extends GetxController {
  var isSwitchedOn = false.obs;
  void toggleSwitch(bool value) {
    isSwitchedOn.value = value;
  }
}
