import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/gathering/controllers/gathering_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class AttendeesDetailsView extends GetView {
  const AttendeesDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GatheringController());
    return Stack(children: [
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
        appBar: NochAppbar(
          title: 'Attendees Details',
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Container(
            height: 100.h,
            width: 110.w,
            decoration: BoxDecoration(
                color: ColorUtil.whitetrnsprnt,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          ImageConstant.pizza,
                          height: 80.kh,
                          width: 80.kw,
                          fit: BoxFit.cover,
                        )),
                        11.kwidthBox,
                        Text(
                          'DIY Pizza night',
                          style: TextStyleUtil.openSans700(
                              fontSize: 20, color: ColorUtil.nblackText),
                        )
                      ],
                    ),
                    16.kheightBox,
                    Text(
                      'When',
                      style: TextStyleUtil.openSans600(
                          fontSize: 16, color: ColorUtil.nblackText),
                    ),
                    8.kheightBox,
                    Text(
                      '28th August 2024 , 8:00 PM',
                      style: TextStyleUtil.openSans400(
                          fontSize: 14, color: ColorUtil.nblackText),
                    ),
                    24.kheightBox,
                    Text(
                      'Guests',
                      style: TextStyleUtil.openSans600(
                          fontSize: 16, color: ColorUtil.nblackText),
                    ),
                    24.kheightBox,
                    Row(
                      children: [
                        Text(
                          'Share list',
                          style: TextStyleUtil.openSans600(
                              fontSize: 16, color: ColorUtil.nblackText),
                        ),
                        8.kwidthBox,
                        Transform.scale(
                          alignment: Alignment.centerLeft,
                          scale: 0.6,
                          child: Theme(
                              data: ThemeData(
                                useMaterial3: true,
                              ).copyWith(
                                colorScheme: Theme.of(context)
                                    .colorScheme
                                    .copyWith(outline: ColorUtil.whitetText),
                              ),
                              child: Obx(
                                () => Switch(
                                  trackOutlineColor:
                                      WidgetStateProperty.resolveWith<Color?>(
                                          (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.pressed) ||
                                        states.contains(WidgetState.selected)) {
                                      return Colors.transparent;
                                    }
                                    return ColorUtil.nblackText;
                                  }),
                                  activeColor: Colors.transparent,
                                  value: controller.isSwitchedOn.value,
                                  activeTrackColor: ColorUtil.whitetText,
                                  inactiveTrackColor: Colors.transparent,
                                  thumbColor:
                                      WidgetStateProperty.resolveWith<Color?>(
                                    (Set<WidgetState> states) {
                                      if (states
                                              .contains(WidgetState.pressed) ||
                                          states
                                              .contains(WidgetState.selected)) {
                                        return Colors.grey;
                                      }
                                      return ColorUtil.nblackText;
                                    },
                                  ),
                                  onChanged: controller.toggleSwitch,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
