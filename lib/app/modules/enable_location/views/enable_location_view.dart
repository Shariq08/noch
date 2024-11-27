import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:noch/app/constants/lottie_constants.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/enable_location_controller.dart';

class EnableLocationView extends GetView<EnableLocationController> {
  const EnableLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.kh,
                    width: 200.kw,
                    child: LottieBuilder.asset(LottieConstant.location),
                  ),
                  16.kheightBox,
                  Text(
                    'Enable Location',
                    style: TextStyleUtil.openSans700(),
                  ),
                  8.kheightBox,
                  Text(
                    'Enable notification to easily search',
                    style: TextStyleUtil.openSans400(fontSize: 16),
                  ),
                  Text(
                    'near you.',
                    style: TextStyleUtil.openSans400(fontSize: 16),
                  )
                ],
              )),
              100.kheightBox,
              Row(
                children: [
                  expandedButton(
                      onPressed: () {
                        Get.offNamed('/enable-location');
                      },
                      title: 'Allow Access',
                      fontsize: 16),
                ],
              ),
              16.kheightBox,
              Row(
                children: [
                  expandedButton(
                      onPressed: () {
                        Get.offNamed('/enable-location');
                      },
                      title: "I'll do that later",
                      fontsize: 16),
                ],
              ),
            ],
          ),
        ));
  }
}
