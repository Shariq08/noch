import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/cart/views/payment_card_view.dart';
import 'package:noch/app/modules/cart/views/payment_confirmed_view.dart';
import 'package:noch/app/modules/cart/views/pickup_view.dart';
import 'package:noch/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:noch/app/modules/delivery/views/address_form_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class DeliveryCartView extends GetView {
  const DeliveryCartView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeliveryController());
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
          appBar: NochAppbar(title: 'Cart'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    color: ColorUtil.whitetrnsprnt,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Card(
                        elevation: 0,
                        color: ColorUtil.whitetText,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: controller.addressList.isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Address',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 16,
                                            color: ColorUtil.nblackText),
                                      ),
                                      4.kheightBox,
                                      Text(
                                        'The Hatch Rotisserie & Bar',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 16,
                                            color: ColorUtil.nblackText),
                                      ),
                                      4.kheightBox,
                                      Text(
                                        '835 13th St. Paso Robles, CA 93446',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 14,
                                            color: ColorUtil.blackgrey),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '+1-12345-12345',
                                            style: TextStyleUtil.openSans400(
                                                fontSize: 14,
                                                color: ColorUtil.blackgrey),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      ColorUtil.whitetrnsprnt,
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          SizedBox(
                                                              height: 666.kh,
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        13.0,
                                                                    horizontal:
                                                                        0),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16.0,
                                                                      vertical:
                                                                          8),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          IconButton(
                                                                              onPressed: () {
                                                                                Get.back();
                                                                              },
                                                                              icon: Icon(Icons.close)),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        'Saved address',
                                                                        style: TextStyleUtil.openSans600(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                ColorUtil.nblackText),
                                                                      ),
                                                                      24.kheightBox,
                                                                      Expanded(
                                                                        child: ListView
                                                                            .builder(
                                                                          itemCount:
                                                                              6,
                                                                          itemBuilder:
                                                                              (BuildContext context, int index) {
                                                                            return Card(
                                                                              elevation: 0,
                                                                              color: ColorUtil.whitetText,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                                                                                child: Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.circle_outlined,
                                                                                      color: ColorUtil.nButtonColor,
                                                                                    ),
                                                                                    16.kwidthBox,
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Ted Wallace',
                                                                                          style: TextStyleUtil.openSans600(fontSize: 16, color: ColorUtil.nblackText),
                                                                                        ),
                                                                                        Text(
                                                                                          '+1-12345-12345',
                                                                                          style: TextStyleUtil.openSans600(fontSize: 14, color: ColorUtil.blackgrey),
                                                                                        ),
                                                                                        Text(
                                                                                          '123 Broadway, New York, NY 10006',
                                                                                          style: TextStyleUtil.openSans600(fontSize: 14, color: ColorUtil.nblackText),
                                                                                        ),
                                                                                      ],
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            76.kh,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            expandedButton(
                                                                                title: 'Add new address',
                                                                                onPressed: () {
                                                                                  Get.to(() => AddressFormView());
                                                                                })
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )));
                                            },
                                            child: Text(
                                              'Change',
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 14,
                                                  color: ColorUtil.nblackText),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Address',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 16,
                                            color: ColorUtil.nblackText),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => AddressFormView());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              ColorUtil.nButtonColor,
                                        ),
                                        child: Text(
                                          "Add address",
                                          style: TextStyleUtil.openSans600(
                                              color: ColorUtil.nblackText),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
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
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        fontSize: 12,
                                                        color: ColorUtil
                                                            .nblackText),
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
                                        borderRadius:
                                            BorderRadius.circular(40)),
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
                  24.kheightBox,
                  Card(
                    color: ColorUtil.whitetrnsprnt,
                    shape: RoundedRectangleBorder(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                style:
                                                    TextStyleUtil.openSans400(
                                                        fontSize: 12,
                                                        color: ColorUtil
                                                            .nButtonColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    16.kheightBox,
                                    billingRowData(
                                        title: 'Total Items', cost: '3'),
                                    7.kheightBox,
                                    billingRowData(
                                        title: 'Total Amount', cost: '45'),
                                    7.kheightBox,
                                    billingRowData(
                                        title: 'Total tip', cost: '5'),
                                    7.kheightBox,
                                    billingRowData(
                                        title: 'Total tax', cost: '5'),
                                    7.kheightBox,
                                    billingRowData(
                                        title: 'Delivery fee', cost: '5'),
                                    7.kheightBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              controller
                                                  .togglefeedAmericaSelection();
                                            },
                                            child: Obx(
                                              () => Row(
                                                children: [
                                                  Icon(
                                                    controller
                                                            .isfeedAmericaselected
                                                            .value
                                                        ? Icons.check_box
                                                        : Icons
                                                            .check_box_outline_blank,
                                                    color:
                                                        ColorUtil.nButtonColor,
                                                  ),
                                                  Text(
                                                    'Feed America',
                                                    style: TextStyleUtil
                                                        .openSans400(
                                                            fontSize: 14,
                                                            color: ColorUtil
                                                                .nblackText),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Obx(() => Text(
                                              controller.isfeedAmericaselected
                                                      .value
                                                  ? r'$1'
                                                  : '',
                                              style: TextStyleUtil.openSans400(
                                                  fontSize: 14,
                                                  color: ColorUtil.nblackText),
                                            ))
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
                                          r'$58',
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
                  36.kheightBox
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
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Obx(() => expandedButton(
                        disablebackgroundColor: ColorUtil.nButtonColorLight,
                        backgroundColor: ColorUtil.nButtonColor,
                        title: 'Make Payment',
                        onPressed: controller.addressList.isEmpty
                            ? null
                            : () {
                                Get.to(() => PaymentCardView());
                              },
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Row billingRowData({String? title, String? cost}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: TextStyleUtil.openSans400(
              fontSize: 14, color: ColorUtil.nblackText),
        ),
        Text(
          r'$' + cost!,
          style: TextStyleUtil.openSans400(
              fontSize: 14, color: ColorUtil.nblackText),
        )
      ],
    );
  }
}
