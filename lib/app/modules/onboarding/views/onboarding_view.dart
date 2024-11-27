import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.data.length,
                onPageChanged: controller.onPageChanged,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        controller.data[index]['img']!,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorUtil.gradient_3,
                                ColorUtil.gradient_2
                              ]),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            Get.offNamed('/signup');
                          },
                          child: Text('Skip',
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.whitetText)),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 100.w,
                          height: 40.h,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: ColorUtil.whitetrnsprnt,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                16.kheightBox,
                                controller.currentIndex.value == 3
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                            controller.data[index]['title']!,
                                            textAlign: TextAlign.start,
                                            style: TextStyleUtil.nTitle(
                                                color: ColorUtil.nblackText)),
                                      )
                                    : Text(controller.data[index]['title']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyleUtil.nTitle(
                                            color: ColorUtil.nblackText)),
                                8.kheightBox,
                                controller.currentIndex.value == 3
                                    ? Text(
                                        controller.data[index]['desc']!,
                                        textAlign: TextAlign.start,
                                        style: TextStyleUtil.nsubTitle(
                                            color: ColorUtil.blackgrey),
                                      )
                                    : Text(
                                        controller.data[index]['desc']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyleUtil.nsubTitle(
                                            color: ColorUtil.blackgrey),
                                      ),
                                Spacer(),
                                Obx(() {
                                  return controller.currentIndex.value == 3
                                      ? Row(
                                          children: [
                                            expandedButton(
                                                onPressed: () {
                                                  Get.offNamed('/signup');
                                                },
                                                title: 'Let’s Get Started !'),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: List.generate(
                                                controller.data.length - 1,
                                                (i) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 4.0),
                                                  child: Icon(
                                                    Icons.brightness_1,
                                                    color: controller
                                                                .currentIndex
                                                                .value ==
                                                            i
                                                        ? ColorUtil
                                                            .nbrightnessIconC1
                                                        : ColorUtil
                                                            .nbrightnessIconC2,
                                                    size: controller
                                                                .currentIndex
                                                                .value ==
                                                            i
                                                        ? 14
                                                        : 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                controller.goToNextPage();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    ColorUtil.nButtonColor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 12),
                                                child: Text(
                                                  "Next",
                                                  style:
                                                      TextStyleUtil.openSans600(
                                                          color: ColorUtil
                                                              .nblackText),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
