import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
        body: Stack(children: [
      Image.asset(ImageConstant.splashimg,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center),
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorUtil.gradient_1, ColorUtil.gradient_2]),
        ),
      ),
      Center(child: Image.asset(ImageConstant.nochLogo))
    ]));
  }
}
