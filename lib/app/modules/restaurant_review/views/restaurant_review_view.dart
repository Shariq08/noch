import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_card.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/restaurant_review_controller.dart';

class RestaurantReviewView extends GetView<RestaurantReviewController> {
  const RestaurantReviewView({super.key});
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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'NOCH reviews',
              style: TextStyleUtil.openSans600(fontSize: 18),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorUtil.whitetText,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, right: 44, left: 6.3),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 72.kh,
                                width: 72.kw,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtil.restrReviewProfile),
                                child: Center(
                                  child: Text(
                                    'H A T C H',
                                    style: TextStyleUtil.openSans700(
                                        fontSize: 12.6,
                                        color: ColorUtil.nblackText2),
                                  ),
                                ),
                              ),
                              16.kwidthBox,
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Rating',
                                          style: TextStyleUtil.openSans600(
                                              fontSize: 16,
                                              color: ColorUtil.nblackText)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('4.5',
                                              style: TextStyleUtil.openSans700(
                                                  fontSize: 40,
                                                  color: ColorUtil.nblackText)),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Icon(
                                              Icons.star,
                                              color: ColorUtil.nButtonColor,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     Icon(
                              //       Icons.star,
                              //       color: ColorUtil.nButtonColor,
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Text(
                                  '200 reviews',
                                  style: TextStyleUtil.openSans600(
                                      color: ColorUtil.nblackText),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      16.kheightBox,
                      Row(
                        children: [
                          reviewchip(title: 'All', isIcon: false),
                          16.kwidthBox,
                          reviewchip(title: 'Top rated', isIcon: false),
                          16.kwidthBox,
                          reviewchip(title: '1', isIcon: true)
                        ],
                      ),
                      8.kheightBox,
                      ReviewCard(),
                      8.kheightBox,
                      ReviewCard(),
                      8.kheightBox,
                      ReviewCard(),
                      8.kheightBox,
                      ReviewCard(),
                      8.kheightBox,
                      ReviewCard(),
                      8.kheightBox,
                      ReviewCard()
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  ChoiceChip reviewchip({required String title, required bool isIcon}) {
    return ChoiceChip(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        side: BorderSide(color: ColorUtil.nButtonColor),
        disabledColor: ColorUtil.whitetText,
        label: Row(
          children: [
            isIcon
                ? Icon(Icons.star, color: ColorUtil.nButtonColor)
                : SizedBox(),
            Text(
              title,
              style: TextStyleUtil.openSans400(
                  fontSize: 12, color: ColorUtil.nblackText),
            ),
          ],
        ),
        selected: false);
  }
}
