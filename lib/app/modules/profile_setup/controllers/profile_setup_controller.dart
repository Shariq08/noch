import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString selectedFileName = ''.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final File file = File(result.files.single.path!);
        selectedFileName.value = result.files.single.name;
      } else {
        selectedFileName.value = '';
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick file: $e");
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e");
    }
  }
}
