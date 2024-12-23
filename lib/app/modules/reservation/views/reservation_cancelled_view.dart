import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class ReservationCancelledView extends GetView {
  const ReservationCancelledView({super.key});
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
        appBar: NochAppbar(
          title: 'Reservations',
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.history,
                  color: ColorUtil.whitetText,
                ))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                children: [
                  Card(
                      color: ColorUtil.whitetText,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 64.kh,
                              width: 64.kw,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtil.cancelbackground),
                              child: Center(
                                  child: Icon(
                                Icons.close,
                                color: ColorUtil.nblackText,
                                weight: 100,
                                size: 40,
                              )),
                            ),
                            8.kwidthBox,
                            Text(
                              'Reservation Canceled',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
                            )
                          ],
                        ),
                      )),
                  24.kheightBox,
                  Container(
                    height: 214.kh,
                    width: 343.kw,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(ImageConstant.reservationCard)),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Stack(children: [
                      IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                ColorUtil.gradient_2,
                                ColorUtil.gradient_1,
                              ])),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40.kh,
                                  width: 40.kw,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2,
                                          color: ColorUtil.whitetText)),
                                  child: ClipOval(
                                    child: Image.asset(
                                      ImageConstant.restrCard2,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                8.kwidthBox,
                                Text(
                                  'The Hatch Rotisserie & Bar',
                                  style: TextStyleUtil.openSans600(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Card(
                                  color: ColorUtil.nButtonColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(80))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0, vertical: 8),
                                    child: Text(
                                      'Back to reservations',
                                      style: TextStyleUtil.openSans600(
                                          color: ColorUtil.nblackText),
                                    ),
                                  ),
                                ),
                                30.kwidthBox,
                                Image.asset(ImageConstant.tableIcon),
                              ],
                            ),
                            16.kheightBox,
                            Image.asset(
                              ImageConstant.menu,
                              fit: BoxFit.fill,
                              height: 32,
                              width: 32,
                            ),
                            16.kheightBox,
                            Image.asset(
                              ImageConstant.gallery,
                              fit: BoxFit.fill,
                              height: 32,
                              width: 32,
                            ),
                            24.kheightBox,
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: 140.kh,
                            width: 140.kw,
                          ),
                          Positioned(
                            left: 30,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 140.kh,
                                width: 140.kw,
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
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}
