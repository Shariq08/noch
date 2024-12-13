// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/home/views/comments_view.dart';
import 'package:noch/app/modules/home/views/notification_view.dart';
import 'package:noch/app/modules/home/views/reel_view.dart';
import 'package:noch/app/modules/reels/views/reels_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    List<Widget> reel = [
      Obx(() {
        return ReelsView(
            isLive: true,
            username: '@nicolefisher',
            imgpath: ImageConstant.reel1,
            desc: 'Loving these tasty pizzas from @domino’s. . ',
            islike: controller.isliked.value,
            onPressedLike: controller.togglelike,
            onPressedComment: controller.toggleCommentVisibility,
            onPressedSave: () {
              showModalBottomSheet(
                  backgroundColor: ColorUtil.whitetrnsprnt,
                  context: context,
                  builder: (BuildContext context) {
                    return RestrBottomshet(
                      onFavTap: () {
                        Get.back();
                        showModalBottomSheet(
                            backgroundColor: ColorUtil.whitetrnsprnt,
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                children: [
                                  37.kheightBox,
                                  Text(
                                    'Save to favorites',
                                    style: TextStyleUtil.openSans600(
                                        fontSize: 18,
                                        color: ColorUtil.nblackText),
                                  ),
                                  53.kheightBox,
                                  Form(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Enter a note (optional)',
                                          style: TextStyleUtil.openSans600(
                                              color: ColorUtil.nblackText),
                                        ),
                                        8.kheightBox,
                                        TextFormField(
                                          maxLines: 3,
                                          decoration: InputDecoration(
                                            hintText: 'Enter here',
                                            fillColor: ColorUtil.whitetText,
                                            filled: true,
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorUtil
                                                        .whitetrnsprnt),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorUtil.whitetrnsprnt,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: ColorUtil
                                                          .whitetrnsprnt,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                          ),
                                        ),
                                        8.kheightBox,
                                        Row(children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 16),
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      ColorUtil.nButtonColor,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 50),
                                                  child: Text(
                                                    'Add to favorites',
                                                    style: TextStyleUtil
                                                        .openSans600(
                                                            fontSize: 16,
                                                            color: ColorUtil
                                                                .nblackText),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ])
                                      ],
                                    ),
                                  ))
                                ],
                              );
                            });
                      },
                      onListTap: () {
                        Get.back();
                        showModalBottomSheet(
                            backgroundColor: ColorUtil.whitetrnsprnt,
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                children: [
                                  37.kheightBox,
                                  Text(
                                    'Save to List',
                                    style: TextStyleUtil.openSans600(
                                        fontSize: 18,
                                        color: ColorUtil.nblackText),
                                  ),
                                  16.kheightBox,
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor:
                                              ColorUtil.whitetrnsprnt,
                                          builder: (BuildContext context) {
                                            return Column(
                                              children: [
                                                24.kheightBox,
                                                Text(
                                                  'New List',
                                                  style:
                                                      TextStyleUtil.openSans600(
                                                          fontSize: 18,
                                                          color: ColorUtil
                                                              .nblackText),
                                                ),
                                                53.kheightBox,
                                                Form(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'List Name',
                                                        style: TextStyleUtil
                                                            .openSans600(
                                                                color: ColorUtil
                                                                    .nblackText),
                                                      ),
                                                      8.kheightBox,
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter your list name here.',
                                                          fillColor: ColorUtil
                                                              .whitetText,
                                                          filled: true,
                                                          focusedBorder: const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: ColorUtil
                                                                      .whitetrnsprnt),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          border:
                                                              const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: ColorUtil
                                                                        .whitetrnsprnt,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          enabledBorder:
                                                              const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: ColorUtil
                                                                        .whitetrnsprnt,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                        ),
                                                      ),
                                                      24.kheightBox,
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                // maximumSize:
                                                                // Size(163.kw,
                                                                //     56.kh),
                                                                side: BorderSide(
                                                                    color: ColorUtil
                                                                        .nButtonColor),
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ColorUtil
                                                                        .nButtonColorLight2,
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        32.0,
                                                                    vertical:
                                                                        16),
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: TextStyleUtil.openSans600(
                                                                      fontSize:
                                                                          16,
                                                                      color: ColorUtil
                                                                          .nblackText),
                                                                ),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ColorUtil
                                                                        .nButtonColor,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            16,
                                                                        horizontal:
                                                                            32),
                                                                child: Text(
                                                                  'Save',
                                                                  style: TextStyleUtil.openSans600(
                                                                      fontSize:
                                                                          16,
                                                                      color: ColorUtil
                                                                          .nblackText),
                                                                ),
                                                              ),
                                                            )
                                                          ])
                                                    ],
                                                  ),
                                                ))
                                              ],
                                            );
                                          });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Container(
                                        height: 64.kh,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color: ColorUtil.whitetText,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Add New List',
                                                style:
                                                    TextStyleUtil.openSans400(
                                                        fontSize: 16,
                                                        color: ColorUtil
                                                            .nblackText),
                                              ),
                                              Image.asset(
                                                  ImageConstant.addButton)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  16.kheightBox,
                                  saveListCard(),
                                  saveListCard(),
                                  saveListCard(),
                                ],
                              );
                            });
                      },
                    );
                  });
            });
      }),
      Obx(() {
        return ReelsView(
            isLive: false,
            username: '@nicolefisher',
            imgpath: ImageConstant.reel2,
            desc: 'Loving these tasty pizzas from @domino’s. ',
            islike: controller.isliked.value,
            onPressedLike: controller.togglelike,
            onPressedComment: () {});
      }),
      Obx(() {
        return ReelsView(
            isLive: false,
            username: '@nicolefisher',
            imgpath: ImageConstant.reel3,
            desc: 'Loving these tasty pizzas from @domino’s. ',
            islike: controller.isliked.value,
            onPressedLike: controller.togglelike,
            onPressedComment: () {});
      }),
      // SizedBox(
      //     height: 100.h,
      //     width: 100.w,
      //     child: Image.asset(
      //       ImageConstant.reel2,
      //       fit: BoxFit.fill,
      //     )),
      // SizedBox(
      //     height: 100.h,
      //     width: 100.w,
      //     child: Image.asset(
      //       ImageConstant.reel3,
      //       fit: BoxFit.fill,
      //     )),
    ];
    return Obx(() {
      return Scaffold(
        body: Stack(children: [
          Container(
            child: PageView(
              scrollDirection: Axis.vertical,
              children: reel,
            ),
          ),
          // IgnorePointer(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //           colors: [ColorUtil.gradient_3, ColorUtil.gradient_2]),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.kh,
                        width: 20.kw,
                        child: Image.asset(
                          ImageConstant.add,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 124.kw,
                        height: 32.kh,
                        child: Image.asset(
                          ImageConstant.nochLogo,
                          width: 124.kw,
                          height: 32.kh,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Image.asset(
                            ImageConstant.compass,
                            width: 24.kw,
                            height: 24.kh,
                            fit: BoxFit.fill,
                          ),
                          8.kwidthBox,
                          InkWell(
                            onTap: controller.toggleNotificationVisibility,
                            child: Image.asset(
                              ImageConstant.notification,
                              width: 24.kw,
                              height: 24.kh,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                16.kheightBox,
                Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'For you',
                        style: TextStyleUtil.openSans600(),
                      ),
                      6.kwidthBox,
                      // FittedBox(
                      //   child: Transform.scale(
                      //     alignment: Alignment.centerLeft,
                      //     scale: 0.6,
                      //     child: FittedBox(
                      //         fit: BoxFit.fill,
                      //         // controller.isSwitchedOn.value
                      //         child: Switch(
                      //           trackOutlineColor:
                      //               WidgetStateProperty.resolveWith<Color?>(
                      //                   (Set<WidgetState> states) {
                      //             if (states.contains(WidgetState.selected)) {
                      //               return ColorUtil.nButtonColor;
                      //             }

                      //             return ColorUtil.whitetText;
                      //           }),
                      //           inactiveTrackColor: Colors.transparent,
                      //           // inactiveThumbColor: ColorUtil.whitetText,
                      //           thumbColor:
                      //               WidgetStateProperty.resolveWith<Color?>(
                      //                   (Set<WidgetState> states) {
                      //             if (states.contains(WidgetState.selected)) {
                      //               return Colors.transparent;
                      //             }

                      //             return ColorUtil.whitetText;
                      //           }),
                      //           activeColor: controller.isSwitchedOn.value
                      //               ? ColorUtil.nButtonColor
                      //               : Colors.transparent,
                      //           value: controller.isSwitchedOn.value,
                      //           onChanged: (bool value) {
                      //             // This is called when the user toggles the switch.

                      //             controller.isSwitchedOn.value =
                      //                 !controller.isSwitchedOn.value;
                      //           },
                      //         )),
                      //   ),
                      // )
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
                          child: Switch(
                            activeColor: Colors.transparent,
                            value: controller.isSwitchedOn.value,
                            activeTrackColor: ColorUtil.nButtonColor,
                            inactiveTrackColor: Colors.transparent,
                            thumbColor: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.pressed) ||
                                    states.contains(WidgetState.selected)) {
                                  return Colors.grey;
                                }
                                return ColorUtil.whitetText;
                              },
                            ),
                            onChanged: controller.toggleSwitch,
                          ),
                        ),
                      ),
                      // Transform.scale(
                      //   alignment: Alignment.centerLeft,
                      //   scale: 0.9,
                      //   child: SlidingToggleSwitch(
                      //     width: 26.kw,
                      //     height: 14.kh,
                      //     disabled: false,
                      //     initialValue: controller.isSwitchedOn.value,
                      //     thumbDisabledColor: ColorUtil.whitetText,
                      //     thumbOnColor: ColorUtil.blackgrey,
                      //     trackDisabledColor: Colors.grey.shade600,
                      //     trackOffColor: Colors.transparent,
                      //     trackOnColor: ColorUtil.nButtonColor,
                      //     thumbOffColor: ColorUtil.whitetText,
                      //     borderColor: ColorUtil.whitetText,
                      //     borderWidth: 1,
                      //     onChange: controller.toggleSwitch,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (controller.isCommentVisible.value)
            GestureDetector(
              onTap: controller.toggleCommentVisibility,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CommentsView(),
                ),
              ),
            ),
          if (controller.isNotificationVisible.value)
            GestureDetector(
              onTap: controller.toggleNotificationVisibility,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: NotificationView(),
                ),
              ),
            ),
        ]),
      );
    });
  }
}

class RestrBottomshet extends StatelessWidget {
  Function()? onFavTap;
  Function()? onListTap;
  RestrBottomshet({super.key, this.onFavTap, this.onListTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorUtil.whitetrnsprnt,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      height: 286.kh,
      width: 100.w,
      child: Column(
        children: [
          37.kheightBox,
          Text(
            'Save Restaurant',
            style: TextStyleUtil.openSans600(
                fontSize: 18, color: ColorUtil.nblackText),
          ),
          24.kheightBox,
          InkWell(
            onTap: onFavTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 64.kh,
                width: 100.w,
                decoration: BoxDecoration(
                    color: ColorUtil.whitetText,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.radio_button_unchecked,
                        color: ColorUtil.nButtonColor,
                      ),
                      16.kwidthBox,
                      Text(
                        'Mark as favourite',
                        style: TextStyleUtil.openSans600(
                            fontSize: 16, color: ColorUtil.nblackText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          16.kheightBox,
          InkWell(
            onTap: onListTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 64.kh,
                width: 100.w,
                decoration: BoxDecoration(
                    color: ColorUtil.whitetText,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.radio_button_unchecked,
                          color: ColorUtil.nButtonColor),
                      16.kwidthBox,
                      Text(
                        'Save to list',
                        style: TextStyleUtil.openSans600(
                            fontSize: 16, color: ColorUtil.nblackText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
