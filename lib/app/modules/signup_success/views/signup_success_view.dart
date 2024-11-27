import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/constants/lottie_constants.dart';
import 'package:noch/app/modules/onboarding/views/onboarding_view.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/signup_success_controller.dart';

class SignupSuccessView extends GetView<SignupSuccessController> {
  const SignupSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 264.kh,
                width: 264.kw,
                child: Stack(children: [
                  LottieBuilder.asset(LottieConstant.signupSuccess),
                  Image.asset(ImageConstant.illustration),
                ]),
              ),
            ),
            16.kheightBox,
            Text(
              'Woohoo !',
              style: TextStyleUtil.openSans700(fontSize: 24),
            ),
            8.kheightBox,
            Center(
              child: Text(
                'Registration is successful!',
                style: TextStyleUtil.openSans400(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                'Please continue to your profile.',
                style: TextStyleUtil.openSans400(fontSize: 16),
              ),
            ),
            200.kheightBox,
            Row(
              children: [
                expandedButton(
                    onPressed: () {
                      Get.offNamed('/profile-setup');
                    },
                    title: 'Continue',
                    fontsize: 16),
              ],
            ),
          ],
        ));
  }
}
