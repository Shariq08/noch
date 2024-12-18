import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/gathering/views/attendees_details_view.dart';
import 'package:noch/app/modules/gathering/views/gathering_confirmed_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class GatheringDetailsView extends GetView {
  const GatheringDetailsView({super.key});
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
        appBar: NochAppbar(
          title: 'Gathering Details',
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => AttendeesDetailsView());
              },
              icon: Icon(Icons.people),
              color: ColorUtil.whitetText,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Stack(children: [
            Container(
              height: 100.h,
              width: 110.w,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                              child: Image.asset(
                            ImageConstant.pizza,
                            height: 80.kh,
                            width: 80.kw,
                            fit: BoxFit.cover,
                          )),
                          11.kwidthBox,
                          Text(
                            'DIY Pizza night',
                            style: TextStyleUtil.openSans700(
                                fontSize: 20, color: ColorUtil.nblackText),
                          )
                        ],
                      ),
                      16.kheightBox,
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
                      24.kheightBox,
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
                      24.kheightBox,
                      Text(
                        'Description',
                        style: TextStyleUtil.openSans600(
                            fontSize: 16, color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      Text(
                        'Join us for an unforgettable evening of BBQ, live music, and stunning city views at our Summer Rooftop BBQ Bash. Enjoy a selection of grilled specialties, refreshing cocktails, and a vibrant atmosphere.',
                        style: TextStyleUtil.openSans400(
                            fontSize: 14, color: ColorUtil.nblackText),
                      ),
                      24.kheightBox,
                      Text(
                        'Location',
                        style: TextStyleUtil.openSans600(
                            fontSize: 16, color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      Container(
                        width: 100.w,
                        height: 180.kh,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            border: Border.all(
                                color: ColorUtil.whitetText, width: 2)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          child: GoogleMap(
                              zoomControlsEnabled: false,
                              markers: {
                                Marker(
                                    markerId: MarkerId('1'),
                                    position: LatLng(35.628063, -120.689270))
                              },
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(35.628063, -120.689270),
                                  zoom: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  expandedButton(
                    title: 'Confirm details',
                    onPressed: () {
                      Get.to(() => GatheringConfirmedView());
                    },
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    ]);
  }
}
