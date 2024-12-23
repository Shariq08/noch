import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:noch/app/modules/reservation/views/reservation_checkin_view.dart';

import 'package:noch/app/modules/reservation/views/reservation_history_view.dart';
import 'package:noch/app/modules/reservation/views/table_reservation_view.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class ReservationListView extends GetView {
  const ReservationListView({super.key});
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Reservations',
              style: TextStyleUtil.openSans600(fontSize: 18),
            ),
            centerTitle: true,
            leading: PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: ColorUtil.whitetText,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'Events',
                    child: Text(
                      'Events',
                      style: TextStyleUtil.openSans600(
                          color: ColorUtil.nblackText),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Gathering',
                    child: Text(
                      'Gathering',
                      style: TextStyleUtil.openSans600(
                          color: ColorUtil.nblackText),
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 'Events') {
                  Get.toNamed(Routes.EVENTS_GATHERINGS,
                      arguments: {'selectedTab': 0});
                } else if (value == 'Gathering') {
                  Get.toNamed(Routes.EVENTS_GATHERINGS,
                      arguments: {'selectedTab': 1});
                }
              },
              icon: Image.asset(
                ImageConstant.filter_3,
                fit: BoxFit.fill,
                height: 32,
                width: 32,
              ),
            ),
            // IconButton(
            //     onPressed: () {}, icon: Image.asset(ImageConstant.filter_3)),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => ReservationHistoryView());
                  },
                  icon: Icon(
                    Icons.history,
                    color: ColorUtil.whitetText,
                  ))
            ],
          ),
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.reservations.length,
                itemBuilder: (BuildContext context, int index) {
                  final reservation = controller.reservations[index];
                  final status = controller.getStatus(reservation.date);
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
                              Text(
                                reservation.restaurantName,
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText),
                              ),
                              Text(
                                status == "Ongoing"
                                    ? "Today"
                                    : reservation.date,
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText4),
                              )
                            ],
                          ),
                          9.kheightBox,
                          Text(
                            reservation.address,
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
                                      reservation.time,
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
                                      side: const BorderSide(
                                          width: 1,
                                          color: ColorUtil.nButtonColor),
                                      elevation: 0,
                                      backgroundColor: status == "Ongoing"
                                          ? ColorUtil.nButtonColor
                                          : ColorUtil.nButtonColorLight3),
                                  onPressed: () {
                                    status == "Ongoing"
                                        ? Get.to(() => ReservationCheckinView())
                                        : Get.to(() => TableReservationView());
                                  },
                                  child: Text(
                                    status,
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
