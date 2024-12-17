import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/restaurant_details_controller.dart';

class RestaurantDetailsView extends GetView<RestaurantDetailsController> {
  const RestaurantDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: 100.h,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                controller.updateIndex(index);
              },
            ),
            items: [
              Image.asset(
                ImageConstant.restrCard1,
                fit: BoxFit.cover,
                width: 100.w,
              ),
              Image.asset(
                ImageConstant.restrCard2,
                fit: BoxFit.fill,
                width: 100.w,
              ),
              Image.asset(
                ImageConstant.restrCard3,
                fit: BoxFit.cover,
                width: 100.w,
              ),
            ],
          ),
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
        Stack(children: [
          Positioned(
              top: 60,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorUtil.whitetText,
                  ))),
          Positioned(
              top: 70, right: 20, child: Image.asset(ImageConstant.bookmark)),
          Positioned(
              top: 350,
              right: 100,
              child: Obx(
                () => Visibility(
                  visible: controller.isCalendarDialog.value,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    color: ColorUtil.whitetText,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          nCalendarButton('Dine-in', () {
                            Get.toNamed('/reservation');
                          }),
                          8.kheightBox,
                          nCalendarButton('Pick-up', () {
                            Get.toNamed('/restaurant-menu',
                                arguments: {'isfromPickup': true});
                          }),
                          8.kheightBox,
                          nCalendarButton('Delivery', () {
                            Get.toNamed(Routes.DELIVERY);
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Text(
                      'The Hatch Rotisserie & Bar',
                      style: TextStyleUtil.openSans700(fontSize: 24),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(ImageConstant.location),
                      Text(
                        '1.3 Miles',
                        style: TextStyleUtil.openSans600(),
                      )
                    ],
                  ),
                  8.kheightBox,
                  Row(
                    children: [
                      restrDetailsCard(
                        child: Text(
                          'America',
                          style: TextStyleUtil.openSans600(
                              fontSize: 12, color: ColorUtil.nblackText),
                        ),
                      ),
                      8.kwidthBox,
                      restrDetailsCard(
                        child: Text(
                          r'$$$$',
                          style: TextStyleUtil.openSans600(
                              fontSize: 12, color: ColorUtil.nblackText),
                        ),
                      ),
                      8.kwidthBox,
                      restrDetailsCard(
                          child: Row(
                        children: [
                          Image.asset(ImageConstant.starfilled),
                          Image.asset(ImageConstant.starfilled)
                        ],
                      ))
                    ],
                  ),
                  restrDetailsCard(
                    child: Text(
                      'Currently open',
                      style: TextStyleUtil.openSans600(
                          fontSize: 12, color: ColorUtil.nblackText),
                    ),
                  ),
                  restrDetailsCard(
                      color: ColorUtil.whitetText,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: ColorUtil.nblackText,
                          ),
                          8.kwidthBox,
                          Text(
                            '4.5K',
                            style: TextStyleUtil.openSans400(
                              fontSize: 12,
                              color: ColorUtil.nblackText,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              right: 180,
              child: Obx(
                () => Row(
                  children: List.generate(
                    3,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        Icons.brightness_1,
                        color: controller.currentIndex.value == i
                            ? ColorUtil.nbrightnessIconC1
                            : ColorUtil.whitetText,
                        size: controller.currentIndex.value == i ? 8 : 5,
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 70,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(ImageConstant.redblink),
                          Container(
                            height: 40.kh,
                            width: 40.kw,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorUtil.nButtonColor,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                ImageConstant.live,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          16.kwidthBox
                        ],
                      ),
                      24.kheightBox,
                      Image.asset(
                        ImageConstant.thumbupfill,
                        height: 24.kh,
                        width: 24.kw,
                      ),
                      15.kheightBox,
                      GestureDetector(
                          onTap: controller.toggleCalendarDialog,
                          child: Image.asset(ImageConstant.calendarcheckfill)),
                      15.kheightBox,
                      GestureDetector(
                          onTap: () {
                            Get.toNamed('/restaurant-menu',
                                arguments: {'isfromPickup': false});
                          },
                          child: Image.asset(ImageConstant.menu)),
                      15.kheightBox,
                      Image.asset(ImageConstant.call),
                      15.kheightBox,
                      GestureDetector(
                          onTap: () {
                            Get.toNamed('/ride-request');
                          },
                          child: Image.asset(ImageConstant.carfill)),
                      15.kheightBox,
                      GestureDetector(
                          onTap: () {
                            Get.toNamed('/restaurant-photos');
                          },
                          child: Image.asset(ImageConstant.gallery)),
                      15.kheightBox,
                      GestureDetector(
                          onTap: () {
                            Get.toNamed('/share-followers');
                          },
                          child: Image.asset(ImageConstant.share)),
                      39.kheightBox,
                    ],
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 160.kh,
                      width: 160.kw,
                    ),
                    Positioned(
                      left: 30,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.ABOUT_RESTAURANT);
                        },
                        child: Container(
                          height: 160.kh,
                          width: 160.kw,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              ImageConstant.mapview,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  ElevatedButton nCalendarButton(String title, Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: Size(163.kw, 56.kh),
        elevation: 0,
        backgroundColor: ColorUtil.nButtonColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          title,
          style: TextStyleUtil.openSans400(
              fontSize: 14, color: ColorUtil.nblackText),
        ),
      ),
    );
  }

  Card restrDetailsCard({Widget? child, Color color = ColorUtil.nButtonColor}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: child),
    );
  }
}
