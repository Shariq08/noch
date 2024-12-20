import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:noch/app/modules/reservation/views/rate_experience_view.dart';
import 'package:noch/app/modules/reservation/views/table_reservation_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class ReservationHistoryView extends GetView {
  const ReservationHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReservationController());
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
            title: 'Reservation history',
            onLeadingPressed: () {
              controller.goToReservation();
            },
          ),
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.reservationsHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  final reservationHistory =
                      controller.reservationsHistory[index];

                  return Card(
                    color: ColorUtil.whitetText,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                elevation: 0,
                                color: reservationHistory.status == "Canceled"
                                    ? ColorUtil.cancelbackground
                                    : ColorUtil.nButtonColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: Text(
                                    reservationHistory.status,
                                    style: TextStyleUtil.openSans600(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText),
                                  ),
                                ),
                              ),
                              Text(
                                reservationHistory.date,
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText4),
                              )
                            ],
                          ),
                          9.kheightBox,
                          Text(
                            reservationHistory.restaurantName,
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.nblackText),
                          ),
                          9.kheightBox,
                          Text(
                            reservationHistory.address,
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.nblackText4),
                          ),
                          8.kheightBox,
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: ColorUtil.whitetText,
                                  border: Border.all(
                                      color: ColorUtil.ncircleavatar),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImageConstant.table,
                                      color: ColorUtil.nblackText,
                                    ),
                                    8.kwidthBox,
                                    Text(
                                      reservationHistory.time,
                                      style: TextStyleUtil.openSans400(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    ),
                                  ],
                                ),
                              ),
                              8.kwidthBox,
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: ColorUtil.nButtonColor),
                                  onPressed: () {
                                    Get.to(() => RateExperienceView());
                                  },
                                  child: Text(
                                    'Rate',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.nblackText),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ))
    ]);
  }
}
