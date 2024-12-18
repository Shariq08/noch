import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/events/views/event_details_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageConstant.restrCard1,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.5)
                // gradient:
                // LinearGradient(
                //     begin: Alignment.centerLeft,
                //     end: Alignment.centerRight,
                //     colors: [
                //   ColorUtil.ntransparentpage,
                //   ColorUtil.whitetrnsprnt,
                //   // ColorUtil.gradient_2,
                //   // ColorUtil.gradient_1,
                // ])
                ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: NochAppbar(
            title: 'Events',
            actions: [
              Image.asset(
                ImageConstant.compass,
              ),
              16.kwidthBox
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => EventDetailsView());
                  },
                  child: Container(
                    height: 264.kh,
                    width: 343.kw,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              ImageConstant.event,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Rooftop BBQ Bash',
                            style: TextStyleUtil.openSans700(fontSize: 20),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 236.kw),
                            child: Text(
                              'Join us for an unforgettable evening of BBQ, live music, and stunning city views.',
                              style: TextStyleUtil.openSans400(
                                  fontSize: 14, color: ColorUtil.whitetText),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          8.kheightBox,
                          Row(
                            children: [
                              Card(
                                color: ColorUtil.whitetText,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4),
                                  child: Row(
                                    children: [
                                      Image.asset(ImageConstant.calendarclear),
                                      4.kwidthBox,
                                      Text(
                                        '28th August 2024 , 8:00 PM',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 12,
                                            color: ColorUtil.nblackText),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: ColorUtil.whitetText,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4),
                                  child: Row(
                                    children: [
                                      Image.asset(ImageConstant.calendarclear),
                                      4.kwidthBox,
                                      Text(
                                        '100',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 12,
                                            color: ColorUtil.nblackText),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          24.kheightBox
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return 8.kheightBox;
              },
            ),
          ),
        )
      ],
    );
  }
}
