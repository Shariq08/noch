import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/report/views/claim_business_form_view.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class MoreAboutRestaurantView extends GetView {
  const MoreAboutRestaurantView({super.key});
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
          appBar: NochAppbar(title: 'More about us'),
          body: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80.kh,
                          width: 80.kw,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtil.restrReviewProfile),
                          child: Center(
                            child: Text(
                              'H A T C H',
                              style: TextStyleUtil.openSans700(
                                  fontSize: 12.6, color: ColorUtil.nblackText2),
                            ),
                          ),
                        ),
                        8.kwidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Text(
                                'The Hatch Rotisserie & Bar',
                                style: TextStyleUtil.openSans700(
                                    fontSize: 20, color: ColorUtil.nblackText),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Text(
                              '835 13th St. Paso Robles, CA 93446',
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.nblackText),
                            ),
                            8.kheightBox,
                            Row(
                              children: [
                                nReservationChip(title: 'American'),
                                nReservationChip(title: r'$$$$'),
                                nReservationChip(title: '11-11:45 '),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    24.kheightBox,
                    Text(
                      'Amentities',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    16.kheightBox,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        customBlackBorderChip(title: 'WIFI'),
                        customBlackBorderChip(title: 'Live Music'),
                        customBlackBorderChip(title: 'Pet friendly')
                      ],
                    ),
                    16.kheightBox,
                    Text(
                      'Menu options',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    16.kheightBox,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        customBlackBorderChip(title: 'Vegan'),
                        customBlackBorderChip(title: 'Kosher'),
                        customBlackBorderChip(title: 'Vegan')
                      ],
                    ),
                    16.kheightBox,
                    Text(
                      'Cuisines offered',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    16.kheightBox,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        customBlackBorderChip(title: 'Chineese'),
                        customBlackBorderChip(title: 'French'),
                        customBlackBorderChip(title: 'Fast food'),
                        customBlackBorderChip(title: 'Indian'),
                        customBlackBorderChip(title: 'Italian'),
                        customBlackBorderChip(title: 'Oriental')
                      ],
                    ),
                    16.kheightBox,
                    Text(
                      'Loyalty program',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    16.kheightBox,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        customBlackBorderChip(title: 'Yes'),
                      ],
                    ),
                    55.kheightBox,
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: ColorUtil.whitetrnsprnt,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 300.kh,
                                decoration: BoxDecoration(
                                    color: ColorUtil.whitetrnsprnt,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(Icons.close),
                                            color: ColorUtil.nblackText,
                                          )
                                        ],
                                      ),
                                      Center(
                                        child: Text(
                                          'Report options',
                                          style: TextStyleUtil.openSans600(
                                              fontSize: 18,
                                              color: ColorUtil.nblackText),
                                        ),
                                      ),
                                      24.kheightBox,
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(ClaimBusinessFormView());
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: ColorUtil.whitetText,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Claim this buisiness',
                                                  style:
                                                      TextStyleUtil.openSans600(
                                                          fontSize: 16,
                                                          color: ColorUtil
                                                              .nblackText),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: ColorUtil.nblackText,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      8.kheightBox,
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.REPORT);
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: ColorUtil.whitetText,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Share your feedback',
                                                  style:
                                                      TextStyleUtil.openSans600(
                                                          fontSize: 16,
                                                          color: ColorUtil
                                                              .nblackText),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: ColorUtil.nblackText,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Text(
                        'Report',
                        style: TextStyleUtil.openSans400(
                            fontSize: 14, color: ColorUtil.nblackText),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Card customBlackBorderChip({String? title}) {
    return Card(
      elevation: 0,
      color: ColorUtil.whitetText,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorUtil.nblackText),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Text(
          title!,
          style: TextStyleUtil.openSans400(
              fontSize: 14, color: ColorUtil.nblackText),
        ),
      ),
    );
  }

  Card nReservationChip({String? title}) {
    return Card(
      elevation: 0,
      color: ColorUtil.whitetText,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Text(
            title!,
            style: TextStyleUtil.openSans600(
                fontSize: 12, color: ColorUtil.nblackText),
          )),
    );
  }
}
