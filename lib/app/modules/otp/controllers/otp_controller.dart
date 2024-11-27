import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  RxBool invalidOtp = false.obs;

  RxInt resendTime = 60.obs;
  late Timer countdownTimer;
  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime.value > 0) {
        resendTime.value -= 1;
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  void validateOtp() {
    if (otp1.text.isNotEmpty &&
        otp2.text.isNotEmpty &&
        otp3.text.isNotEmpty &&
        otp4.text.isNotEmpty &&
        otp5.text.isNotEmpty &&
        otp6.text.isNotEmpty) {
      print('00000');
      invalidOtp.value = false;
      Get.offNamed('/signup-success');
    } else {
      invalidOtp.value = true;
      print('11111');
    }
  }

  void resendOtp() {
    resendTime.value = 60;
    startTimer();
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
