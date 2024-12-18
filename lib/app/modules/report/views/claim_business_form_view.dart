import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/report/controllers/report_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/decoration.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../../../components/noch_appbar.dart';

class ClaimBusinessFormView extends GetView {
  const ClaimBusinessFormView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());
    return Stack(
      children: [
        Image.asset(
          ImageConstant.restrback,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  ColorUtil.gradient_1,
                  ColorUtil.gradient_2,
                  ColorUtil.gradient_2,
                  ColorUtil.gradient_1,
                ])),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: NochAppbar(
            title: 'Claim this Business',
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 23),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Please fill up the form below',
                          style: TextStyleUtil.openSans600(
                              fontSize: 16, color: ColorUtil.nblackText),
                        ),
                      ),
                      16.kheightBox,
                      Text(
                        'Enter business name',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                          decoration: textformdecorationwithoutborder(
                              hint: 'Enter your name')),
                      8.kheightBox,
                      Text(
                        'Enter business email',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        decoration: textformdecorationwithoutborder(
                            hint: 'Enter  email'),
                      ),
                      8.kheightBox,
                      Text(
                        'Enter business address',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        decoration: textformdecorationwithoutborder(
                            hint: 'Enter address'),
                      ),
                      8.kheightBox,
                      Text(
                        'Upload Business certificate',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      GestureDetector(
                        onTap: () {
                          controller.pickcertificate();
                        },
                        child: Container(
                          height: 160.kh,
                          width: 343.kw,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorUtil.whitetText),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() {
                                final fileName =
                                    controller.selectedcertificate.value;
                                return fileName.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          "Selected File: $fileName",
                                          style: TextStyleUtil.openSans400(
                                            color: ColorUtil.nblackText,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink();
                              }),
                              Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageConstant.upload,
                                    color: ColorUtil.nButtonColor,
                                  ),
                                  8.kwidthBox,
                                  Text(
                                    'Upload certificate',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 16,
                                        color: ColorUtil.nblackText),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                      8.kheightBox,
                      Text(
                        'Upload ownership ID',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      GestureDetector(
                        onTap: () {
                          controller.pickownershippID();
                        },
                        child: Container(
                          height: 160.kh,
                          width: 343.kw,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorUtil.whitetText),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() {
                                final fileName =
                                    controller.selectedownershipid.value;
                                return fileName.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          "Selected File: $fileName",
                                          style: TextStyleUtil.openSans400(
                                            color: ColorUtil.nblackText,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink();
                              }),
                              Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageConstant.upload,
                                    color: ColorUtil.nButtonColor,
                                  ),
                                  8.kwidthBox,
                                  Text(
                                    'Upload certificate',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 16,
                                        color: ColorUtil.nblackText),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                      22.kheightBox,
                      Row(
                        children: [
                          expandedButton(
                            title: 'Submit Request',
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
