import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/delivery/views/delivery_cart_view.dart';
import 'package:noch/app/modules/reservation/views/checkin_table_withoutserver_view.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/restaurant_menu_controller.dart';

class RestaurantMenuView extends GetView<RestaurantMenuController> {
  const RestaurantMenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
          appBar: NochAppbar(title: 'The Hatch Rotisserie & Bar'),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: ColorUtil.whitetText,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 208.kw,
                            height: 500.kh,
                            padding: EdgeInsets.all(16),
                            child: ListView(
                              children: List.generate(controller.options.length,
                                  (index) {
                                return ListTile(
                                  title: Text(controller.options[index]),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              }),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 48.kh,
                    width: 168.kw,
                    decoration: BoxDecoration(
                        color: ColorUtil.nButtonColor,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22.0, vertical: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ENTREES',
                            style: TextStyleUtil.openSans600(
                                fontSize: 16, color: ColorUtil.nblackText),
                          ),
                          16.kwidthBox,
                          Image.asset(
                            ImageConstant.arrowDown,
                            color: ColorUtil.nblackText,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              19.kheightBox,
              Expanded(
                child: ListView.builder(
                  itemCount: controller.menuList.length,
                  itemBuilder: (context, index) {
                    bool isRightAligned = index % 2 != 0;
                    final menuItem = controller.menuList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/dish-deatails');
                      },
                      child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: isRightAligned
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            children: [
                              Card(
                                color: ColorUtil.whitetText,
                                shape: RoundedRectangleBorder(
                                  borderRadius: isRightAligned
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                        )
                                      : const BorderRadius.only(
                                          topLeft: Radius.circular(100),
                                          bottomLeft: Radius.circular(100),
                                        ),
                                ),
                                // height: 161.kh,
                                // width: 343.kw,
                                // decoration: BoxDecoration(
                                //   color: ColorUtil.whitetText,
                                //   borderRadius: isRightAligned
                                //       ? const BorderRadius.only(
                                //           topRight: Radius.circular(100),
                                //           bottomRight: Radius.circular(100),
                                //         )
                                //       : const BorderRadius.only(
                                //           topLeft: Radius.circular(100),
                                //           bottomLeft: Radius.circular(100),
                                //         ),
                                // ),
                                child: Row(
                                  mainAxisAlignment: isRightAligned
                                      ? MainAxisAlignment.spaceBetween
                                      : MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (isRightAligned)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorUtil
                                                          .nButtonColor),
                                                  height: 26.kh,
                                                  width: 126.kw,
                                                  child: Center(
                                                    child: Text(
                                                      'Signature Dish',
                                                      style: TextStyleUtil
                                                          .openSans400(
                                                              fontSize: 12,
                                                              color: ColorUtil
                                                                  .nblackText),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            8.kheightBox,
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 11.0),
                                              child: Text(
                                                menuItem['title'],
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        color: ColorUtil
                                                            .nblackText),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 11.0),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth: 148.kw,
                                                ),
                                                child: Text(
                                                  menuItem['details'],
                                                  style:
                                                      TextStyleUtil.openSans400(
                                                          fontSize: 14,
                                                          color: ColorUtil
                                                              .blackgrey),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                            8.kheightBox,
                                            Padding(
                                              padding: isRightAligned
                                                  ? const EdgeInsets.only(
                                                      left: 8.0)
                                                  : const EdgeInsets.only(
                                                      right: 8.0),
                                              child: Row(
                                                children: [
                                                  controller.isFromPickup
                                                      ? Row(
                                                          children: [
                                                            Obx(
                                                              () => Visibility(
                                                                visible: controller
                                                                            .showEditIcon[
                                                                        index] ??
                                                                    false,
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons.edit,
                                                                    color: ColorUtil
                                                                        .nButtonColor,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    specialInstructionSheet(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 97.kw,
                                                              height: 37.kh,
                                                              decoration: BoxDecoration(
                                                                  color: ColorUtil
                                                                      .nButtonColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40)),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        12.0,
                                                                    vertical:
                                                                        8),
                                                                child: Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () =>
                                                                          controller
                                                                              .decrementOrderSize(index),
                                                                      child: Icon(
                                                                          Icons
                                                                              .remove),
                                                                    ),
                                                                    8.kwidthBox,
                                                                    Obx(
                                                                      () =>
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          '${controller.orderSizes[index] ?? 0}',
                                                                          style: TextStyleUtil.openSans700(
                                                                              fontSize: 14,
                                                                              color: ColorUtil.nblackText),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    8.kwidthBox,
                                                                    GestureDetector(
                                                                      onTap: () => controller.incrementOrderSize(
                                                                          context,
                                                                          index),
                                                                      child: Icon(
                                                                          Icons
                                                                              .add),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : SizedBox.shrink(),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11.0),
                                                      child: Obx(
                                                        () => Text(
                                                          r'$' +
                                                              (int.parse(controller
                                                                          .menuList[
                                                                              index]
                                                                              [
                                                                              "price"]
                                                                          .replaceAll(
                                                                              r'$',
                                                                              '')) *
                                                                      (controller
                                                                              .orderSizes[index] ??
                                                                          0))
                                                                  .toString(),
                                                          style: TextStyleUtil
                                                              .openSans600(
                                                                  fontSize: 16,
                                                                  color: ColorUtil
                                                                      .nblackText),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: isRightAligned
                                          ? EdgeInsets.only(right: 5)
                                          : EdgeInsets.only(left: 5),
                                      child: ClipOval(
                                          child: Image.asset(
                                        menuItem['imgpath'],
                                        height: 155.kh,
                                        width: 175.5.kw,
                                        fit: BoxFit.cover,
                                      )),
                                    ),

                                    if (!isRightAligned)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorUtil
                                                          .nButtonColor),
                                                  height: 26.kh,
                                                  width: 126.kw,
                                                  child: Center(
                                                    child: Text(
                                                      'Signature Dish',
                                                      style: TextStyleUtil
                                                          .openSans400(
                                                              fontSize: 12,
                                                              color: ColorUtil
                                                                  .nblackText),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            8.kheightBox,
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 18.0),
                                              child: Text(
                                                menuItem['title'],
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        color: ColorUtil
                                                            .nblackText),
                                              ),
                                            ),
                                            ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth: 148.kw),
                                              child: Text(
                                                menuItem['details'],
                                                style:
                                                    TextStyleUtil.openSans400(
                                                        fontSize: 14,
                                                        color: ColorUtil
                                                            .blackgrey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                              ),
                                            ),
                                            8.kheightBox,
                                            Padding(
                                              padding: isRightAligned
                                                  ? const EdgeInsets.only(
                                                      left: 8.0)
                                                  : const EdgeInsets.only(
                                                      right: 8.0),
                                              child: Row(
                                                children: [
                                                  controller.isFromPickup
                                                      ? Row(
                                                          children: [
                                                            Obx(
                                                              () => Visibility(
                                                                visible: controller
                                                                            .showEditIcon[
                                                                        index] ??
                                                                    false,
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons.edit,
                                                                    color: ColorUtil
                                                                        .nButtonColor,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    specialInstructionSheet(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 81.kw,
                                                              height: 37.kh,
                                                              decoration: BoxDecoration(
                                                                  color: ColorUtil
                                                                      .nButtonColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40)),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8.0,
                                                                    vertical:
                                                                        8),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () =>
                                                                          controller
                                                                              .decrementOrderSize(index),
                                                                      child: Icon(
                                                                          Icons
                                                                              .remove),
                                                                    ),
                                                                    Obx(
                                                                      () =>
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          '${controller.orderSizes[index] ?? 0}',
                                                                          style: TextStyleUtil.openSans700(
                                                                              fontSize: 14,
                                                                              color: ColorUtil.nblackText),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap: () => controller.incrementOrderSize(
                                                                          context,
                                                                          index),
                                                                      child: Icon(
                                                                          Icons
                                                                              .add),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : SizedBox.shrink(),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11.0),
                                                      child: Obx(
                                                        () => Text(
                                                          r'$' +
                                                              (int.parse(controller
                                                                          .menuList[
                                                                              index]
                                                                              [
                                                                              "price"]
                                                                          .replaceAll(
                                                                              r'$',
                                                                              '')) *
                                                                      (controller
                                                                              .orderSizes[index] ??
                                                                          0))
                                                                  .toString(),
                                                          style: TextStyleUtil
                                                              .openSans600(
                                                                  fontSize: 16,
                                                                  color: ColorUtil
                                                                      .nblackText),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    // if (!isRightAligned)
                                    //   Spacer(), // Ensures the last container sticks to the right
                                    // if (!isRightAligned)
                                    //   Container(
                                    //     decoration: BoxDecoration(
                                    //         color: ColorUtil.nButtonColor),
                                    //     height: 26.kh,
                                    //     width: 126.kw,
                                    //   ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: isRightAligned ? 250 : 90,
                          child: Container(
                            width: 77.kw,
                            height: 29.kh,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                color: ColorUtil.nButtonColorLight2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ColorUtil.nButtonColor,
                                  ),
                                  Text(
                                    menuItem['rating'],
                                    style: TextStyleUtil.openSans600(
                                        color: ColorUtil.nblackText),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
            ]),
          ),
          bottomNavigationBar: Obx(() => Visibility(
                visible: controller.isButtonEnabled.value,
                child: Container(
                  height: 80.kh,
                  width: 100.w,
                  color: ColorUtil.whitetrnsprnt,
                  child: Row(
                    children: [
                      expandedButton(
                        title: 'Confirm Order',
                        onPressed: () {
                          if (controller.isFromDelivery) {
                            Get.to(() => DeliveryCartView());
                          } else if (controller.isFromTable) {
                            Get.offAll(() => CheckinTableWithoutserverView(),
                                arguments: {'isOrderSelect': true});
                          } else {
                            Get.toNamed(Routes.CART);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )),
          extendBody: true,
        )
      ],
    ));
  }

  Future<dynamic> specialInstructionSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => Container(
              height: 619.kh,
              width: 100.w,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Wrap(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'ROTISSERIE CHICKEN',
                          style: TextStyleUtil.openSans600(
                              fontSize: 18, color: ColorUtil.nblackText),
                        ),
                      ),
                      16.kheightBox,
                      Text(
                        'Add ons',
                        style: TextStyleUtil.openSans600(
                            fontSize: 14, color: ColorUtil.nblackText),
                      ),
                      12.kheightBox,
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          children: List.generate(
                            controller.addsonItems.length,
                            (index) {
                              final item = controller.addsonItems[index];
                              return Column(
                                children: [
                                  adsonItemswithCounter(
                                    index,
                                    itemName: item['name'],
                                    itemPrice: item['price'],
                                  ),
                                  8.kheightBox
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      16.kheightBox,
                      Text(
                        'Add special instructions',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Add instructions',
                          hintStyle: TextStyleUtil.openSans400(
                              fontSize: 14, color: ColorUtil.nblackText),
                          fillColor: ColorUtil.whitetText,
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorUtil.whitetrnsprnt),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                      16.kheightBox,
                      Column(
                        children: List.generate(
                          controller.restrictItems.length,
                          (index) {
                            final item = controller.restrictItems[index];
                            return Column(
                              children: [
                                restrictItem(index, itemName: item['name']),
                                8.kheightBox
                              ],
                            );
                          },
                        ),
                      ),
                      16.kheightBox,
                      Row(
                        children: [
                          expandedButton(
                            title: r'Add Item $24',
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            ));
  }

  Row restrictItem(int index, {String? itemName}) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.restrictaddonItem(index),
          child: Obx(
            () {
              bool isChecked = controller.isRestrictItem[index] ?? false;
              return isChecked
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank);
            },
          ),
        ),
        8.kwidthBox,
        Text(
          itemName!,
          style: TextStyleUtil.openSans400(
              fontSize: 14, color: ColorUtil.nblackText),
        )
      ],
    );
  }

  Row adsonItemswithCounter(int index, {String? itemName, int? itemPrice}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemName!,
          style: TextStyleUtil.openSans400(
              fontSize: 14, color: ColorUtil.nblackText),
        ),
        Row(
          children: [
            Obx(
              () => Text(
                r'$' +
                    (itemPrice! * (controller.addonOrderSizes[index] ?? 0))
                        .toString(),
                style: TextStyleUtil.openSans600(color: ColorUtil.nblackText),
              ),
            ),
            8.kwidthBox,
            Container(
              width: 81.kw,
              height: 29.kh,
              decoration: BoxDecoration(
                  color: ColorUtil.nButtonColor,
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.decrementAddonSize(index),
                      child: Icon(
                        Icons.remove,
                        size: 16,
                      ),
                    ),
                    Obx(
                      () => Center(
                        child: Text(
                          '${controller.addonOrderSizes[index]}',
                          style: TextStyleUtil.openSans700(
                              fontSize: 14, color: ColorUtil.nblackText),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.incrementAddonSize(index),
                      child: Icon(
                        Icons.add,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
