import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  RxString selectedcertificate = ''.obs;
  RxString selectedownershipid = ''.obs;

  Future<void> pickcertificate() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final File file = File(result.files.single.path!);
        selectedcertificate.value = result.files.single.name;
      } else {
        selectedcertificate.value = '';
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick file: $e");
    }
  }

  Future<void> pickownershippID() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final File file = File(result.files.single.path!);
        selectedownershipid.value = result.files.single.name;
      } else {
        selectedownershipid.value = '';
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick file: $e");
    }
  }
}
