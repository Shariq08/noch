import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/services/colors.dart';

class SignupController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  RxBool isNameValid = false.obs;
  RxBool isPhoneValid = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isButtonEnabled = false.obs;
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  void _checkFormValidity() {
    isButtonEnabled.value =
        nameController.text.isNotEmpty && phoneController.text.isNotEmpty;
  }

  onSignupTap() {
    if (formKey.currentState!.validate()) {
      Get.toNamed('/otp', arguments: {'isfromlogin': false});
    } else {}
  }

  Color resolveBackgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled) || !isButtonEnabled.value) {
      return ColorUtil.nButtonColorLight;
    }
    return ColorUtil.nButtonColor;
  }

  void validateForm() {
    isButtonEnabled.value = isNameValid.value && isPhoneValid.value;
  }

  nameValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter Your Name';
    } else if (!(nameRegExp.hasMatch(value!))) {
      return 'Enter a Valid Name';
    }
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

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_checkFormValidity);
    phoneController.addListener(_checkFormValidity);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    referralController.dispose();
  }
}
