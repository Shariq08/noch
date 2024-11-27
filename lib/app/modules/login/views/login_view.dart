import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/custom_widget.dart';
import 'package:noch/app/services/decoration.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyleUtil.openSans700(
                          color: ColorUtil.whitetText),
                    ),
                    Text(
                      'Enter your login details',
                      style: TextStyleUtil.openSans400(
                          color: ColorUtil.whitetText),
                    ),
                    24.kheightBox,
                    Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone Number',
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.whitetText)),
                            8.kheightBox,
                            TextFormField(
                              validator: (value) =>
                                  controller.phoneValidator(value!),
                              onChanged: (value) {
                                controller.isPhoneValid.value =
                                    value.isNotEmpty;
                                controller.validateForm();
                              },
                              style: TextStyleUtil.openSans400(fontSize: 14),
                              controller: controller.phoneController,
                              decoration: textFormInputDecoration(
                                  'Enter your phone number'),
                            ),
                            32.kheightBox,
                            Obx(
                              () => Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed:
                                          controller.isButtonEnabled.value
                                              ? () => controller.onLoginTap()
                                              : null,
                                      style: ButtonStyle(
                                          elevation: WidgetStateProperty.all(0),
                                          backgroundColor: WidgetStateProperty
                                              .resolveWith<Color>(
                                            controller.resolveBackgroundColor,
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 18, horizontal: 60),
                                        child: Text(
                                          'Login',
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
                    24.kheightBox,
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text('   Or login with   ',
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
                  ],
                ),
                200.kheightBox,
                Column(
                  children: [
                    Center(
                        child: Text(
                      'Don’t have an account ?',
                      style: TextStyleUtil.openSans400(fontSize: 14),
                    )),
                    Center(
                        child: InkWell(
                      onTap: () {
                        Get.offNamed('/signup');
                      },
                      child: Text(
                        'Create an account',
                        style: TextStyleUtil.openSans500(fontSize: 14),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
