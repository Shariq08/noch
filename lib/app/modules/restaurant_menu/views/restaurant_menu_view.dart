import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
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
                              Container(
                                height: 161.kh,
                                width: 343.kw,
                                decoration: BoxDecoration(
                                  color: ColorUtil.whitetText,
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
                                                    maxWidth: 148.kw),
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
                                              padding: const EdgeInsets.only(
                                                  left: 11.0),
                                              child: Text(
                                                menuItem['price'],
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        fontSize: 16,
                                                        color: ColorUtil
                                                            .nblackText),
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
                                              padding: const EdgeInsets.only(
                                                  right: 11.0),
                                              child: Text(
                                                menuItem['price'],
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        fontSize: 16,
                                                        color: ColorUtil
                                                            .nblackText),
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
        )
      ],
    ));
  }
}
