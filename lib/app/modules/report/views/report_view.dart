import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/decoration.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});
  @override
  Widget build(BuildContext context) {
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
            title: 'Report this restaurant',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'How can we help?',
                        style: TextStyleUtil.openSans600(
                            fontSize: 16, color: ColorUtil.nblackText),
                      ),
                    ),
                    16.kheightBox,
                    Text(
                      'Enter name',
                      style: TextStyleUtil.openSans600(
                          color: ColorUtil.nblackText),
                    ),
                    8.kheightBox,
                    TextField(
                        decoration: textformdecorationwithoutborder(
                            hint: 'Enter your name')),
                    8.kheightBox,
                    Text(
                      'Enter  email',
                      style: TextStyleUtil.openSans600(
                          color: ColorUtil.nblackText),
                    ),
                    8.kheightBox,
                    TextField(
                      decoration:
                          textformdecorationwithoutborder(hint: 'Enter  email'),
                    ),
                    8.kheightBox,
                    Text(
                      'Why you want to report this restaurant',
                      style: TextStyleUtil.openSans600(
                          color: ColorUtil.nblackText),
                    ),
                    8.kheightBox,
                    TextField(
                      maxLines: 3,
                      decoration: textformdecorationwithoutborder(
                          hint: 'Enter messages', radius: 24),
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
        )
      ],
    );
  }
}
