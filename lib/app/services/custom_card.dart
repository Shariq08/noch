import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class RestroCard extends StatelessWidget {
  Function()? onPressedCamera;
  Function()? onCardTap;
  RxInt currentIndex;
  RestroCard(
      {super.key,
      required this.onPressedCamera,
      required this.onCardTap,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onCardTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            height: 332.kh,
            width: 100.w,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 332.kh,
                viewportFraction: 1.0,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                },
              ),
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.asset(
                    ImageConstant.restrCard1,
                    fit: BoxFit.cover,
                    width: 100.w,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.asset(
                    ImageConstant.restrCard2,
                    fit: BoxFit.cover,
                    width: 100.w,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.asset(
                    ImageConstant.restrCard3,
                    fit: BoxFit.cover,
                    width: 100.w,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 332.kh,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    24.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(0),
                            onPressed: onPressedCamera,
                            icon: Icon(
                              Icons.camera_alt,
                              color: ColorUtil.whitetText,
                            )),
                        Text(
                          '"Delicious comfort food "',
                          style: TextStyleUtil.openSans600(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Get Up to 20% off',
                            style: TextStyleUtil.openSans600(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 26.kh,
                        width: 75.kw,
                        decoration: BoxDecoration(
                          color: ColorUtil.nblack07,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Center(
                          child: Text(
                            'American',
                            style: TextStyleUtil.openSans600(fontSize: 12),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'The Hatch Rotisserie & Bar',
                            style: TextStyleUtil.openSans700(fontSize: 20),
                          ),
                          Image.asset(ImageConstant.nochFork)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.brightness_1,
                            color: ColorUtil.nButtonColor,
                            size: 10,
                          ),
                          Text(
                            'Currently open',
                            style: TextStyleUtil.openSans600(),
                          ),
                          8.kwidthBox,
                          Image.asset(
                            ImageConstant.mapPin,
                            color: ColorUtil.whitetText,
                          ),
                          Text(
                            '1.3 Miles',
                            style: TextStyleUtil.openSans600(),
                          ),
                        ],
                      ),
                      16.kheightBox,
                      Row(
                        children: [
                          restrCardChip(
                            onTap: () {
                              Get.toNamed('/restaurant-review');
                            },
                            imgpath: ImageConstant.nochFork,
                            title: '4.5',
                          ),
                          8.kwidthBox,
                          restrCardChip(
                            onTap: () {},
                            imgpath: ImageConstant.googleLogo,
                            title: '4.5',
                          ),
                          8.kwidthBox,
                          restrCardChip(
                            onTap: () {},
                            imgpath: ImageConstant.yelp,
                            title: '4.5',
                          )
                        ],
                      ),
                      19.kheightBox,
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (i) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Icon(
                                Icons.brightness_1,
                                color: currentIndex.value == i
                                    ? ColorUtil.nbrightnessIconC1
                                    : ColorUtil.whitetText,
                                size: currentIndex.value == i ? 8 : 5,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell restrCardChip(
      {required String imgpath,
      required String title,
      required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 23.kh,
        width: 48.kw,
        decoration: BoxDecoration(
            color: ColorUtil.nButtonColorLight2,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Image.asset(
                imgpath,
                height: 18.kh,
                width: 18.kw,
              ),
              Text(
                title,
                style: TextStyleUtil.openSans400(
                    fontSize: 10, color: ColorUtil.nblackText),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(ImageConstant.reviewerProfile),
                  ),
                  8.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Irish sonya',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      Text(
                        'Mon, 05/11/2024',
                        style: TextStyleUtil.openSans600(
                            fontSize: 12, color: ColorUtil.blackgrey),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '5',
                    style:
                        TextStyleUtil.openSans600(color: ColorUtil.nblackText),
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtil.nButtonColor,
                    size: 16,
                  )
                ],
              )
            ],
          ),
          8.kheightBox,
          Text(
            'The steak was perfectly cooked and melted in my mouth, while the service was top-notch and attentive. A must-visit for any steak lover!',
            style: TextStyleUtil.openSans400(
                fontSize: 14, color: ColorUtil.blackgrey2),
          )
        ],
      ),
    );
  }
}

class ConfirmationCard extends StatelessWidget {
  String title;
  String subtitle;
  ConfirmationCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 303.kh,
      width: 100.w,
      decoration: BoxDecoration(
          color: ColorUtil.whitetText,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.checkmark),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyleUtil.openSans600(
                  fontSize: 16, color: ColorUtil.nblackText),
            ),
            32.kheightBox,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyleUtil.openSans600(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: ColorUtil.nblackText),
            )
          ],
        ),
      ),
    );
  }
}
