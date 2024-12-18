import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/cart/controllers/cart_controller.dart';
import 'package:noch/app/modules/cart/views/payment_card_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class OrderDetailsView extends GetView {
  const OrderDetailsView({super.key});
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
        appBar: NochAppbar(title: 'Order details'),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: ColorUtil.whitetrnsprnt,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                                    horizontal: 12,
                                                    vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: controller.selectedDay
                                                              .value ==
                                                          index
                                                      ? ColorUtil.nButtonColor
                                                      : ColorUtil.whitetText,
                                                  border: Border.all(
                                                    color:
                                                        ColorUtil.ncircleavatar,
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
                                      horizontal: 12.0, vertical: 8),
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
                        16.kheightBox,
                        Text(
                          'The Hatch Rotisserie & Bar',
                          style: TextStyleUtil.openSans600(
                              fontSize: 16, color: ColorUtil.nblackText),
                        ),
                        Text(
                          '835 13th St. Paso Robles, CA 93446',
                          style: TextStyleUtil.openSans400(
                              fontSize: 14, color: ColorUtil.blackgrey),
                        ),
                        Text(
                          '+1-12345-12345',
                          style: TextStyleUtil.openSans400(
                              fontSize: 14, color: ColorUtil.blackgrey),
                        )
                      ],
                    ),
                  ),
                ),
                8.kheightBox,
                Container(
                  height: 212.kh,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: ColorUtil.whitetrnsprnt,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Column(
                    children:
                        List.generate(controller.cartList.length, (index) {
                      final item = controller.cartList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 0,
                          color: ColorUtil.whitetText,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    item['imgpath'],
                                    width: 48.kw,
                                    height: 48.kh,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                12.kwidthBox,
                                SizedBox(
                                  width: 160.kw,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 16,
                                            color: ColorUtil.nblackText),
                                      ),
                                      Text(
                                        item['details'],
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 12,
                                            color: ColorUtil.nblackText),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            r'$' + item['price'],
                                            style: TextStyleUtil.openSans600(
                                                fontSize: 14,
                                                color: ColorUtil.nblackText),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 36.0),
                                            child: Text(
                                              'Edit item',
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 12,
                                                  color: ColorUtil.nblackText),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 64.kw,
                                  height: 28.kh,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: ColorUtil.nButtonColor),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () => controller
                                              .decrementCartSize(index),
                                          child: Icon(
                                            Icons.remove,
                                            size: 12,
                                          ),
                                        ),
                                        Center(
                                            child: Obx(
                                          () => Text(
                                            '${controller.cartSizes[index] ?? 0}',
                                            style: TextStyleUtil.openSans700(
                                                fontSize: 14,
                                                color: ColorUtil.nblackText),
                                          ),
                                        )),
                                        GestureDetector(
                                          onTap: () => controller
                                              .incrementCartSize(index),
                                          child: Icon(
                                            Icons.add,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                8.kheightBox,
                Container(
                  height: 335.kh,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: ColorUtil.whitetrnsprnt,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          color: ColorUtil.whitetText,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Payment method',
                                      style: TextStyleUtil.openSans600(
                                          color: ColorUtil.nblackText),
                                    ),
                                    8.kheightBox,
                                    Text(
                                      'Debit / Credit Card',
                                      style: TextStyleUtil.openSans400(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    )
                                  ],
                                ),
                                Text(
                                  'Change',
                                  style: TextStyleUtil.openSans600(
                                      decoration: TextDecoration.underline,
                                      color: ColorUtil.nblackText),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                            elevation: 0,
                            color: ColorUtil.whitetText,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Billing Details',
                                        style: TextStyleUtil.openSans600(
                                            color: ColorUtil.nblackText),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: ColorUtil.nButtonColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: ColorUtil.nButtonColor,
                                            ),
                                            Text(
                                              'add tip',
                                              style: TextStyleUtil.openSans400(
                                                  fontSize: 12,
                                                  color:
                                                      ColorUtil.nButtonColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  16.kheightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Items',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 14,
                                            color: ColorUtil.nblackText),
                                      ),
                                      Text(
                                        '3',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 14,
                                            color: ColorUtil.nblackText),
                                      )
                                    ],
                                  ),
                                  7.kheightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Amount',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 14,
                                            color: ColorUtil.nblackText),
                                      ),
                                      Text(
                                        r'$45',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 14,
                                            color: ColorUtil.nblackText),
                                      )
                                    ],
                                  ),
                                  7.kheightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Discount',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 14,
                                            color: ColorUtil.nblackText),
                                      ),
                                      Text(
                                        r'-$5',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 14,
                                            color: ColorUtil.nblackText),
                                      )
                                    ],
                                  ),
                                  19.kheightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total payable',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 16,
                                            color: ColorUtil.nblackText),
                                      ),
                                      Text(
                                        r'$16',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 16,
                                            color: ColorUtil.nblackText),
                                      )
                                    ],
                                  ),
                                  24.kheightBox
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          height: 80.kh,
          decoration: BoxDecoration(
              color: ColorUtil.whitetText,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                expandedButton(
                  title: 'Make payment',
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: ColorUtil.whitetrnsprnt,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              height: 416.kh,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13.0, horizontal: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              color: ColorUtil.nblackText,
                                            ))
                                      ],
                                    ),
                                    Center(
                                      child: Text(
                                        'Choose Payment Method',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 18,
                                            color: ColorUtil.nblackText),
                                      ),
                                    ),
                                    24.kheightBox,
                                    paymentOption(
                                        title: 'Credit / Debit Card',
                                        option: 'Credit / Debit Card'),
                                    paymentOption(
                                        title: 'Cash', option: 'Cash'),
                                    paymentOption(
                                        title: 'Noch Wallet',
                                        option: 'Noch Wallet'),
                                    24.kheightBox,
                                    Row(
                                      children: [
                                        expandedButton(
                                            title: 'Continue',
                                            onPressed: () {
                                              Get.to(() => PaymentCardView());
                                            })
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                  },
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget paymentOption({String? title, required String option}) {
    final controller = Get.put(CartController());
    return GestureDetector(
      onTap: () {
        controller.updateSelectedPayment(option);
      },
      child: Card(
        elevation: 0,
        color: ColorUtil.whitetText,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Row(
            children: [
              Obx(
                () => Icon(
                  controller.selectedPaymentOption.value == option
                      ? Icons.circle
                      : Icons.circle_outlined,
                  color: ColorUtil.nButtonColor,
                ),
              ),
              8.kwidthBox,
              Text(
                title!,
                style: TextStyleUtil.openSans600(
                    fontSize: 16, color: ColorUtil.nblackText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
