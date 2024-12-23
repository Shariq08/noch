import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/reservation/views/reservation_history_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/decoration.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class RateExperienceView extends GetView {
  const RateExperienceView({super.key});
  @override
  Widget build(BuildContext context) {
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
        appBar: NochAppbar(title: 'Rate your experience'),
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Card(
            color: ColorUtil.whitetrnsprnt,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40.kh,
                            width: 40.kw,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                ImageConstant.restrCard2,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          8.kwidthBox,
                          Text(
                            'Outback steak house',
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.nblackText),
                          )
                        ],
                      ),
                    ),
                    24.kheightBox,
                    ExpansionTile(
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: ColorUtil.nblackText,
                          ),
                        ],
                      ),
                      backgroundColor: ColorUtil.whitetText,
                      collapsedBackgroundColor: ColorUtil.whitetText,
                      collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food',
                            style: TextStyleUtil.openSans600(
                                fontSize: 16, color: ColorUtil.nblackText),
                          ),
                          8.kheightBox,
                          Row(
                            children: [
                              ratingStar(),
                              2.kwidthBox,
                              ratingStar(),
                              2.kwidthBox,
                              ratingStar(),
                              2.kwidthBox,
                              ratingStar(),
                              2.kwidthBox,
                              ratingStar()
                            ],
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Steak wuth mashed potao',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText4),
                                  ),
                                  Text(
                                    r'$20',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText4),
                                  ),
                                ],
                              ),
                              8.kheightBox,
                              Row(
                                children: [
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar()
                                ],
                              ),
                              4.kheightBox,
                              TextField(
                                maxLines: 3,
                                decoration: textFormInputDecoration(
                                    'Enter here',
                                    fillColor: ColorUtil.whitetText,
                                    sideColor: ColorUtil.nblackText4),
                              )
                            ],
                          ),
                        ),
                        8.kheightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Steak wuth mashed potao',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText4),
                                  ),
                                  Text(
                                    r'$20',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText4),
                                  ),
                                ],
                              ),
                              8.kheightBox,
                              Row(
                                children: [
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar()
                                ],
                              ),
                              4.kheightBox,
                              TextField(
                                maxLines: 3,
                                decoration: textFormInputDecoration(
                                    'Enter here',
                                    fillColor: ColorUtil.whitetText,
                                    sideColor: ColorUtil.nblackText4),
                              )
                            ],
                          ),
                        ),
                        8.kheightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Steak wuth mashed potao',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText4),
                                  ),
                                  Text(
                                    r'$20',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText4),
                                  ),
                                ],
                              ),
                              8.kheightBox,
                              Row(
                                children: [
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar(),
                                  2.kwidthBox,
                                  ratingStar()
                                ],
                              ),
                              4.kheightBox,
                              TextField(
                                maxLines: 3,
                                decoration: textFormInputDecoration(
                                    'Enter here',
                                    fillColor: ColorUtil.whitetText,
                                    sideColor: ColorUtil.nblackText4),
                              )
                            ],
                          ),
                        ),
                        16.kheightBox
                      ],
                    ),
                    16.kheightBox,
                    SizedBox(
                      width: 100.w,
                      child: Card(
                          elevation: 0,
                          color: ColorUtil.whitetText,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ambience',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 16,
                                      color: ColorUtil.nblackText),
                                ),
                                8.kheightBox,
                                Row(
                                  children: [
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar()
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    16.kheightBox,
                    SizedBox(
                      width: 100.w,
                      child: Card(
                          elevation: 0,
                          color: ColorUtil.whitetText,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Service',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 16,
                                      color: ColorUtil.nblackText),
                                ),
                                8.kheightBox,
                                Row(
                                  children: [
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar(),
                                    2.kwidthBox,
                                    ratingStar()
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    16.kheightBox,
                    Text(
                      'Write a review',
                      style: TextStyleUtil.openSans600(
                          fontSize: 16, color: ColorUtil.nblackText),
                    ),
                    4.kheightBox,
                    TextField(
                      maxLines: 3,
                      decoration: textformdecorationwithoutborder(
                          radius: 24, hint: 'Enter here'),
                    ),
                    16.kheightBox,
                    Row(
                      children: [
                        expandedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 259.kh,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 24),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Thank you!',
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 18,
                                                  color: ColorUtil.nblackText),
                                            ),
                                            32.kheightBox,
                                            Text(
                                              'Your review helps other to understand restaurants better.',
                                              textAlign: TextAlign.center,
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 18,
                                                  color: ColorUtil.nblackText),
                                            ),
                                            32.kheightBox,
                                            Row(
                                              children: [
                                                expandedButton(
                                                  title: 'Back to history',
                                                  onPressed: () {
                                                    Get.off(() =>
                                                        ReservationHistoryView());
                                                  },
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            title: 'Submit review')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Row ratingStar() {
    return Row(
      children: [
        Container(
          height: 16.kh,
          width: 16.kw,
          decoration: BoxDecoration(
              border: Border.all(color: ColorUtil.nblackText4),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              Icons.star,
              color: ColorUtil.nblackText4,
              size: 10,
            ),
          ),
        )
      ],
    );
  }
}
