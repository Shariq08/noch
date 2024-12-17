import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/cart/views/pickup_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
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
          appBar: NochAppbar(title: 'Cart'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
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
                24.kheightBox,
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
                32.kheightBox,
                Row(
                  children: [
                    expandedButton(
                      title: 'schedule pick up',
                      onPressed: () {
                        Get.to(() => PickupView());
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
