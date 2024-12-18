import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_widget.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    void handleOtpChange() {
      controller.validateOtp();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorUtil.whitetText,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify',
              style: TextStyleUtil.openSans700(),
            ),
            Text(
              'Verify your account',
              style: TextStyleUtil.openSans400(),
            ),
            80.kheightBox,
            Center(
              child: Text(
                'Please enter the verification code sent to',
                style: TextStyleUtil.openSans400(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                '+1 123456789',
                style: TextStyleUtil.openSans400(fontSize: 16),
              ),
            ),
            20.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpField(
                  controller: controller.otp1,
                  onChanged: (_) => handleOtpChange(),
                ),
                OtpField(
                  controller: controller.otp2,
                  onChanged: (_) => handleOtpChange(),
                ),
                OtpField(
                  controller: controller.otp3,
                  onChanged: (_) => handleOtpChange(),
                ),
                OtpField(
                  controller: controller.otp4,
                  onChanged: (_) => handleOtpChange(),
                ),
                OtpField(
                  controller: controller.otp5,
                  onChanged: (_) => handleOtpChange(),
                ),
                OtpField(
                  controller: controller.otp6,
                  onChanged: (_) => handleOtpChange(),
                )
              ],
            ),
            32.kheightBox,
            Obx(() {
              return controller.resendTime.value == 0
                  ? InkWell(
                      onTap: () {
                        controller.resendOtp();
                      },
                      child: Center(
                        child: Text(
                          'Resend Code',
                          style: TextStyleUtil.openSans600(),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        'Resend Code (${controller.resendTime.value}s)',
                        style: TextStyleUtil.openSans600(),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}
