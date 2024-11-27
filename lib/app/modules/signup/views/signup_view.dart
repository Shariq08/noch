import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_widget.dart';
import 'package:noch/app/services/decoration.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: TextStyleUtil.openSans700(color: ColorUtil.whitetText),
              ),
              Text(
                'Enter your details ',
                style: TextStyleUtil.openSans400(color: ColorUtil.whitetText),
              ),
              24.kheightBox,
              Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name',
                          style: TextStyleUtil.openSans600(
                              color: ColorUtil.whitetText)),
                      8.kheightBox,
                      TextFormField(
                        validator: (value) => controller.nameValidator(value),
                        style: TextStyleUtil.openSans400(fontSize: 14),
                        onChanged: (value) {
                          controller.isNameValid.value = value.isNotEmpty;
                          controller.validateForm();
                        },
                        controller: controller.nameController,
                        decoration: textFormInputDecoration('Enter your name'),
                      ),
                      16.kheightBox,
                      Text('Phone Number',
                          style: TextStyleUtil.openSans600(
                              color: ColorUtil.whitetText)),
                      8.kheightBox,
                      TextFormField(
                        validator: (value) => controller.phoneValidator(value!),
                        style: TextStyleUtil.openSans400(fontSize: 14),
                        onChanged: (value) {
                          controller.isPhoneValid.value = value.isNotEmpty;
                          controller.validateForm();
                        },
                        controller: controller.phoneController,
                        decoration:
                            textFormInputDecoration('Enter your phone number'),
                      ),
                      16.kheightBox,
                      Text(
                        'Enter referral code (optional)',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.whitetText),
                      ),
                      8.kheightBox,
                      TextFormField(
                        style: TextStyleUtil.openSans400(fontSize: 14),
                        controller: controller.referralController,
                        decoration: textFormInputDecoration('Enter your code'),
                      ),
                      22.kheightBox,
                      Obx(
                        () => Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: controller.isButtonEnabled.value
                                    ? () => controller.onSignupTap()
                                    : null,
                                style: ButtonStyle(
                                    elevation: WidgetStateProperty.all(0),
                                    backgroundColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      controller.resolveBackgroundColor,
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 60),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyleUtil.genSans600(
                                        fontSize: 16,
                                        color: ColorUtil.blackgrey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              16.kheightBox,
              Row(
                children: [
                  Expanded(child: Divider()),
                  Text('   Or  sign up  with   ',
                      style: TextStyleUtil.openSans600(
                          fontSize: 12, color: ColorUtil.whitetText)),
                  Expanded(child: Divider())
                ],
              ),
              24.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RectangleTile(
                    path: ImageConstant.appleLogo,
                  ),
                  RectangleTile(
                    path: ImageConstant.fbLogo,
                  ),
                  RectangleTile(path: ImageConstant.googleLogo)
                ],
              ),
              32.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Already have an account ? ',
                          style: TextStyleUtil.openSans400(fontSize: 14),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed('/login');
                                },
                              text: 'Login',
                              style: TextStyleUtil.openSans500(fontSize: 14),
                            )
                          ])),
                ],
              ),
              16.kheightBox,
              Wrap(children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: TextStyleUtil.openSans400(fontSize: 12),
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions ',
                            style: TextStyleUtil.openSans600(fontSize: 12),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyleUtil.openSans400(fontSize: 12),
                          ),
                          TextSpan(
                            text: 'Privacy Policy ',
                            style: TextStyleUtil.openSans600(fontSize: 12),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyleUtil.openSans400(fontSize: 12),
                          ),
                          TextSpan(
                            text: 'Content Policy',
                            style: TextStyleUtil.openSans600(fontSize: 12),
                          )
                        ])),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
