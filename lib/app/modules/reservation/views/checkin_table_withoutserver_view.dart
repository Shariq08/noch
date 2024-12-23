import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:noch/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class CheckinTableWithoutserverView extends GetView {
  const CheckinTableWithoutserverView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReservationController());
    Get.lazyPut(() => NavigationController());
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
          backgroundColor: Colors.transparent,
          appBar: NochAppbar(
            title: 'Table Details',
            onLeadingPressed: () {
              controller.goToHome();
            },
            actions: [
              Obx(() => Visibility(
                    visible: !(controller.isTable.value ||
                        (Get.arguments?['isOrderSelect'] ?? true)),
                    child: InkWell(
                      onTap: controller.openCamera,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Image.asset(ImageConstant.qrScan),
                      ),
                    ),
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: ColorUtil.whitetText,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 24),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 36.0),
                                child: ClipOval(
                                    child: Image.asset(
                                  ImageConstant.server,
                                  height: 80.kh,
                                  width: 80.kw,
                                  fit: BoxFit.cover,
                                )),
                              ),
                              12.kheightBox,
                              Text(
                                'Justin Smith',
                                style: TextStyleUtil.openSans700(
                                    fontSize: 18, color: ColorUtil.nblackText),
                              ),
                              4.kheightBox,
                              Text(
                                'Your Server',
                                style: TextStyleUtil.openSans400(
                                    fontSize: 14, color: ColorUtil.nblackText),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(() => Visibility(
                            visible: controller.isTable.value ||
                                Get.arguments['isOrderSelect'],
                            child: Card(
                              color: ColorUtil.whitetText,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 24),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 36.0),
                                      child: Container(
                                        height: 80.kh,
                                        width: 80.kw,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorUtil.nButtonColor),
                                        child: Center(
                                            child: Image.asset(
                                          ImageConstant.tableIcon,
                                          color: ColorUtil.nblackText,
                                          height: 48.kh,
                                          width: 48.kw,
                                        )),
                                      ),
                                    ),
                                    12.kheightBox,
                                    Text(
                                      '3',
                                      style: TextStyleUtil.openSans700(
                                          fontSize: 18,
                                          color: ColorUtil.nblackText),
                                    ),
                                    4.kheightBox,
                                    Text(
                                      'Table Number',
                                      style: TextStyleUtil.openSans400(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  Visibility(
                    visible: Get.arguments['isOrderSelect'] ?? false,
                    child: Column(
                      children: [
                        16.kheightBox,
                        Card(
                          color: ColorUtil.whitetText,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Order',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 16,
                                      color: ColorUtil.nblackText),
                                ),
                                16.kheightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Items',
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    ),
                                    Text(
                                      'Quantity',
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Price',
                                          style: TextStyleUtil.openSans600(
                                              fontSize: 14,
                                              color: ColorUtil.nblackText),
                                        ),
                                        8.kwidthBox
                                      ],
                                    ),
                                  ],
                                ),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Hatch Burger',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Key Lime Pie',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Cappuccino',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Hatch Burger',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Key Lime Pie',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Hatch Burger',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Hatch Burger',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                customOrderDetail(
                                    name: 'Hatch Burger',
                                    quantity: '1',
                                    price: r'$10'),
                                12.kheightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Item total',
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          r'$60',
                                          style: TextStyleUtil.openSans600(
                                              fontSize: 14,
                                              color: ColorUtil.nblackText),
                                        ),
                                        8.kwidthBox
                                      ],
                                    ),
                                  ],
                                ),
                                16.kheightBox,
                                Text('special instructions',
                                    style: TextStyleUtil.openSans600(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText)),
                                16.kheightBox,
                                bulletPointer('Add no tomatoes in chicken'),
                                bulletPointer('Add no lettuce in my burger'),
                                bulletPointer('Add no tomatoes in chicken'),
                                bulletPointer(
                                    'I am allergic to peanuts don’t add them.')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.kheightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.CHAT);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ColorUtil.nButtonColor,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                          child: Text(
                            'Chat with Host',
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.nblackText),
                          ),
                        ),
                      ),
                      Get.arguments['isOrderSelect']
                          ? ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.CHAT);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: ColorUtil.nButtonColor,
                              ),
                              child: Text(
                                'Chat with server',
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText),
                              ),
                            )
                          : Obx(
                              () => ElevatedButton(
                                onPressed: controller.isTable.value ||
                                            Get.arguments['isOrderSelect'] ??
                                        false
                                    ? () {
                                        Get.offNamed(Routes.RESTAURANT_MENU,
                                            arguments: {
                                              'isfromPickup': true,
                                              'isfromdelivery': false,
                                              'isfromTable': true
                                            });
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  disabledBackgroundColor:
                                      ColorUtil.nButtonColorLight,
                                  backgroundColor: controller.isTable.value ||
                                              Get.arguments['isOrderSelect'] ??
                                          false
                                      ? ColorUtil.nButtonColor
                                      : ColorUtil.nButtonColorLight,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 24),
                                  child: Text(
                                    'Start Order',
                                    style: TextStyleUtil.openSans600(
                                        color: ColorUtil.nblackText),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ))
    ]);
  }

  Row bulletPointer(String? text) {
    return Row(
      children: [
        Text(
          '\u2022',
          style: TextStyleUtil.openSans600(
              fontSize: 12, color: ColorUtil.nblackText),
        ),
        5.kwidthBox,
        Text(
          text!,
          style: TextStyleUtil.openSans600(
              fontSize: 12, color: ColorUtil.nblackText),
        )
      ],
    );
  }

  Row customOrderDetail({String? name, String? quantity, String? price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            name!,
            style: TextStyleUtil.openSans400(
                fontSize: 14, color: ColorUtil.nblackText),
          ),
        ),
        SizedBox(
          width: 50.kw,
          child: Text(
            quantity!,
            textAlign: TextAlign.left,
            style: TextStyleUtil.openSans400(
                fontSize: 14, color: ColorUtil.nblackText),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            price!,
            textAlign: TextAlign.right,
            style: TextStyleUtil.openSans400(
                fontSize: 14, color: ColorUtil.nblackText),
          ),
        ),
        8.kwidthBox
      ],
    );
  }
}
