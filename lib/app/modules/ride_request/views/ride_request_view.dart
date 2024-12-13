import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/storage.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/ride_request_controller.dart';

class RideRequestView extends GetView<RideRequestController> {
  const RideRequestView({super.key});
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
          appBar: NochAppbar(title: 'Request a Ride'),
          body: Column(
            children: [
              24.kheightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 100.w,
                  height: 360.kh,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: Obx(
                        () => GoogleMap(
                            onMapCreated: controller.onMapCreated,
                            markers: Set<Marker>.of(controller.markers.value),
                            initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    37.42796133580664, -122.085749655962),
                                zoom: 10)),
                      )),
                ),
              ),
              16.kheightBox,
              Container(
                  height: 88.kh,
                  width: 343.kw,
                  decoration: BoxDecoration(
                      color: ColorUtil.whitetrnsprnt,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        color: ColorUtil.nButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 8),
                          child: Text(
                            'Uber',
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.nblackText),
                          ),
                        ),
                      ),
                      8.kwidthBox,
                      Card(
                        elevation: 0,
                        color: ColorUtil.nButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 8),
                          child: Text(
                            'Lyft',
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.nblackText),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }
}
