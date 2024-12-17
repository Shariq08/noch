import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/events/controllers/events_controller.dart';
import 'package:noch/app/modules/events/views/event_confirmed_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class EventDetailsView extends GetView {
  const EventDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventsController());
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
          appBar: NochAppbar(title: 'Event Details'),
          body: Padding(
            padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
            child: Container(
              width: 100.w,
              height: 80.h,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                              child: Image.asset(
                            ImageConstant.eventdetail,
                            height: 80.kh,
                            width: 80.kw,
                            fit: BoxFit.cover,
                          )),
                          11.kwidthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rooftop BBQ Bash',
                                style: TextStyleUtil.openSans700(
                                    fontSize: 20, color: ColorUtil.nblackText),
                              ),
                              12.kheightBox,
                              Obx(
                                () => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      backgroundColor: ColorUtil.nButtonColor),
                                  onPressed: controller.toggleInterest,
                                  child: controller.isInterested.value
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.check,
                                                color: ColorUtil.nblackText),
                                            SizedBox(width: 8),
                                            Text('Interested',
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        color: ColorUtil
                                                            .nblackText)),
                                          ],
                                        )
                                      : Text(
                                          'Are You Interested ?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      24.kheightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'When',
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 16,
                                          color: ColorUtil.nblackText),
                                    ),
                                    Text(
                                      '28th August 2024 , 8:00 PM',
                                      style: TextStyleUtil.openSans400(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    ),
                                  ],
                                ),
                                24.kwidthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'When',
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 16,
                                          color: ColorUtil.nblackText),
                                    ),
                                    Text(
                                      r'$100 / seat',
                                      style: TextStyleUtil.openSans400(
                                          fontSize: 14,
                                          color: ColorUtil.nblackText),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            24.kheightBox,
                            Text(
                              'Description',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
                            ),
                            8.kheightBox,
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 311.kw),
                              child: Text(
                                'Join us for an unforgettable evening of BBQ, live music, and stunning city views at our Summer Rooftop BBQ Bash. Enjoy a selection of grilled specialties, refreshing cocktails, and a vibrant atmosphere.',
                                style: TextStyleUtil.openSans400(
                                    fontSize: 14, color: ColorUtil.nblackText),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 6,
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible: controller.isPartySizeVisible.value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Party size',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 18,
                                            color: ColorUtil.nblackText),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap:
                                                controller.decrementPartySize,
                                            child: Container(
                                                height: 25.6.kh,
                                                width: 25.6.kw,
                                                decoration: BoxDecoration(
                                                    color: ColorUtil
                                                        .nButtonColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                3.2))),
                                                child: Icon(Icons.remove)),
                                          ),
                                          8.kwidthBox,
                                          Obx(
                                            () => Container(
                                                height: 26.kh,
                                                width: 41.kw,
                                                decoration: BoxDecoration(
                                                    color: ColorUtil.whitetText,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                3.7))),
                                                child: Center(
                                                  child: Text(
                                                    '${controller.partySize.value}',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: ColorUtil
                                                            .nblackText,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )),
                                          ),
                                          8.kwidthBox,
                                          GestureDetector(
                                            onTap:
                                                controller.incrementPartySize,
                                            child: Container(
                                                height: 25.6.kh,
                                                width: 25.6.kw,
                                                decoration: BoxDecoration(
                                                    color: ColorUtil
                                                        .nButtonColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                3.2))),
                                                child: Icon(Icons.add)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            24.kheightBox,
                            Text(
                              'Location',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
                            ),
                            24.kheightBox,
                            Stack(children: [
                              SizedBox(
                                width: 100.w,
                                height: 180.kh,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  child: GoogleMap(
                                      zoomControlsEnabled: false,
                                      markers: {
                                        Marker(
                                            markerId: MarkerId('1'),
                                            position:
                                                LatLng(35.628063, -120.689270))
                                      },
                                      initialCameraPosition: CameraPosition(
                                          target:
                                              LatLng(35.628063, -120.689270),
                                          zoom: 15)),
                                ),
                              ),
                              Obx(() => Visibility(
                                    visible:
                                        controller.isPartySizeVisible.value,
                                    child: Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ColorUtil.nButtonColor),
                                            onPressed: () {
                                              Get.to(
                                                  () => EventConfirmedView());
                                            },
                                            child: Text(
                                              r'Pay $100',
                                              style: TextStyleUtil.openSans600(
                                                  color: ColorUtil.nblackText),
                                            )),
                                      ),
                                    ),
                                  ))
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
