import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/services/colors.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final TextEditingController phoneController = TextEditingController();

  RxBool isPhoneValid = false.obs;

  final RxBool isButtonEnabled = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _checkFormValidity() {
    isButtonEnabled.value = phoneController.text.isNotEmpty;
  }

  onLoginTap() {
    if (formKey.currentState!.validate()) {
      Get.toNamed('/otp');
    } else {}
  }

  Color resolveBackgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled) || !isButtonEnabled.value) {
      return ColorUtil.nButtonColorLight;
    }
    return ColorUtil.nButtonColor;
  }

  phoneValidator(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid phone number';
    }
  }

  void validateForm() {
    isButtonEnabled.value = isPhoneValid.value;
  }

  @override
  void onInit() {
    phoneController.addListener(_checkFormValidity);
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
