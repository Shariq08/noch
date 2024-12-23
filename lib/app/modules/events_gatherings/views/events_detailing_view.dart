import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/events/views/event_confirmed_view.dart';
import 'package:noch/app/modules/events_gatherings/controllers/events_gatherings_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class EventsDetailingView extends GetView {
  const EventsDetailingView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventsGatheringsController());
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
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      backgroundColor: ColorUtil.nButtonColor),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.check,
                                          color: ColorUtil.nblackText),
                                      SizedBox(width: 8),
                                      Text('Attending',
                                          style: TextStyleUtil.openSans600(
                                              color: ColorUtil.nblackText)),
                                    ],
                                  )),
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
                            Text(
                              'When',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
                            ),
                            8.kheightBox,
                            Text(
                              '28th August 2024 , 8:00 PM',
                              style: TextStyleUtil.openSans400(
                                  fontSize: 14, color: ColorUtil.nblackText),
                            ),
                            16.kheightBox,
                            Text(
                              'Where',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
                            ),
                            8.kheightBox,
                            Text(
                              'Hatchback rotisserie, 835 13th St. Paso Robles, CA 93446',
                              style: TextStyleUtil.openSans400(
                                  fontSize: 14, color: ColorUtil.nblackText),
                            ),
                            16.kheightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Party size',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 16,
                                      color: ColorUtil.nblackText),
                                ),
                                Text(
                                  '2',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 14,
                                      color: ColorUtil.nblackText),
                                ),
                              ],
                            ),
                            16.kheightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount paid',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 16,
                                      color: ColorUtil.nblackText),
                                ),
                                Text(
                                  r'$200',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 14,
                                      color: ColorUtil.nblackText),
                                ),
                              ],
                            ),
                            16.kheightBox,
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
                              Positioned(
                                top: 40,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              ColorUtil.nButtonColor),
                                      onPressed: () {},
                                      child: Text(
                                        'Cancel Event',
                                        style: TextStyleUtil.openSans600(
                                            color: ColorUtil.nblackText),
                                      )),
                                ),
                              ),
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
