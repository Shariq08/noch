import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/cart/controllers/cart_controller.dart';
import 'package:noch/app/modules/cart/views/order_details_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class PickupView extends GetView {
  const PickupView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

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
          appBar: NochAppbar(title: 'Pick up'),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80.kh,
                          width: 80.kw,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtil.restrReviewProfile),
                          child: Center(
                            child: Text(
                              'H A T C H',
                              style: TextStyleUtil.openSans700(
                                  fontSize: 12.6, color: ColorUtil.nblackText2),
                            ),
                          ),
                        ),
                        8.kwidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Text(
                                'The Hatch Rotisserie & Bar',
                                style: TextStyleUtil.openSans700(
                                    fontSize: 20, color: ColorUtil.nblackText),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Text(
                              '835 13th St. Paso Robles, CA 93446',
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.nblackText),
                            ),
                            8.kheightBox,
                            Row(
                              children: [
                                nReservationChip(title: 'American'),
                                8.kwidthBox,
                                nReservationChip(title: '11- 11:45 pm'),
                                8.kwidthBox,
                                nReservationChip(title: r'$$$$'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    24.kheightBox,
                    Text(
                      'Pick up time',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    16.kheightBox,
                    Obx(() => ExpansionTile(
                          key: UniqueKey(),
                          initiallyExpanded: controller.isExpanded.value,
                          onExpansionChanged: (expanded) {
                            controller.isExpanded.value = expanded;
                          },
                          dense: true,
                          expandedAlignment: Alignment.topLeft,
                          title: Text(
                            controller.selectedDay.value == -1
                                ? 'Select Day'
                                : controller
                                    .daypref[controller.selectedDay.value],
                            style: TextStyleUtil.openSans600(
                                fontSize: 16, color: ColorUtil.nblackText),
                          ),
                          backgroundColor: ColorUtil.whitetText,
                          collapsedBackgroundColor: ColorUtil.whitetText,
                          collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          children: [
                            Obx(() => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    spacing: 8,
                                    alignment: WrapAlignment.start,
                                    children: [
                                      ...controller.daypref
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int index = entry.key;
                                        String i = entry.value;

                                        return GestureDetector(
                                          onTap: () {
                                            controller.toggleDayPref(index);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: controller
                                                          .selectedDay.value ==
                                                      index
                                                  ? ColorUtil.nButtonColor
                                                  : ColorUtil.whitetText,
                                              border: Border.all(
                                                color: ColorUtil.ncircleavatar,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Text(
                                              i,
                                              style: TextStyle(
                                                color: ColorUtil.nblackText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ))
                          ],
                        )),
                    16.kheightBox,
                    GestureDetector(
                        onTap: () {
                          DateTime tempTime = DateTime.now();

                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => Container(
                              height: 300,
                              color: Colors.white,
                              child: GestureDetector(
                                onTap: () {
                                  controller.updateTime(tempTime);
                                  Navigator.pop(context);
                                },
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  initialDateTime: tempTime,
                                  use24hFormat: false,
                                  onDateTimeChanged: (DateTime newTime) {
                                    tempTime =
                                        newTime; // Update the temporary time
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        child: Obx(
                          () => Card(
                            elevation: 0,
                            color: ColorUtil.whitetText,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.selectedTime.isEmpty
                                          ? 'Pick time'
                                          : controller.selectedTime.value,
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 16,
                                          color: ColorUtil.nblackText),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Spacer(),
                    Row(
                      children: [
                        expandedButton(
                          title: 'Continue',
                          onPressed: () {
                            Get.to(() => OrderDetailsView());
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ))
    ]);
  }

  Card nReservationChip({String? title}) {
    return Card(
      elevation: 0,
      color: ColorUtil.whitetText,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Text(
            title!,
            style: TextStyleUtil.openSans600(
                fontSize: 12, color: ColorUtil.nblackText),
          )),
    );
  }
}
