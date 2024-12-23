import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/events_gatherings/views/events_detailing_view.dart';
import 'package:noch/app/modules/gathering/views/gathering_details_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/events_gatherings_controller.dart';

class EventsGatheringsView extends GetView<EventsGatheringsController> {
  const EventsGatheringsView({super.key});
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
          appBar: NochAppbar(title: 'Events & Gatherings'),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 48.kh,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorUtil.whitetText),
                    color: ColorUtil.nButtonColor,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: controller.tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.all(4),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: ColorUtil.whitetText,
                    ),
                    labelColor: ColorUtil.nblackText,
                    unselectedLabelColor: ColorUtil.nblackText,
                    tabs: const [
                      Tab(text: 'Events'),
                      Tab(text: 'Gatherings'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return eventGatheringsDetailCard(
                                title: 'Rooftop BBQ Bash', type: 'events');
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 24),
                      //   child: Column(
                      //     children: [()],
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return eventGatheringsDetailCard(
                                title: 'DIY Pizza night', type: 'gatherings');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget eventGatheringsDetailCard({String? title, String? type}) {
    return GestureDetector(
      onTap: () {
        type == 'events'
            ? Get.to(() => EventsDetailingView())
            : Get.to(() => GatheringDetailsView());
      },
      child: Card(
        color: ColorUtil.whitetrnsprnt,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 72.kh,
                width: 72.kw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    type == 'events'
                        ? ImageConstant.menu3
                        : ImageConstant.pizza,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              8.kwidthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title!,
                          style: TextStyleUtil.openSans600(
                              color: ColorUtil.nblackText),
                        ),
                        8.kwidthBox,
                        Card(
                          elevation: 0,
                          color: ColorUtil.nButtonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 4),
                            child: Text(
                              type == 'events' ? 'Attending' : 'Yes',
                              style: TextStyleUtil.openSans400(
                                  fontSize: 10, color: ColorUtil.nblackText),
                            ),
                          ),
                        ),
                        type == 'events' ? Icon(Icons.more_vert) : SizedBox()
                      ],
                    ),
                    8.kheightBox,
                    Text(
                      softWrap: true,
                      'Join us for an unforgettable evening of BBQ, live music, and stunning city views.',
                      style: TextStyleUtil.openSans400(
                          letterSpacing: 0.4,
                          fontSize: 12,
                          height: 1.6,
                          color: ColorUtil.blackgrey),
                    ),
                    8.kheightBox,
                    Row(
                      children: [
                        customEventDetailCard(
                            title: '28th August 2024 , 8:00 PM',
                            imgPath: ImageConstant.calendarclear),
                        4.kwidthBox,
                        type == 'events'
                            ? customEventDetailCard(
                                title: '100', imgPath: ImageConstant.dollarIcon)
                            : Card(
                                elevation: 0,
                                color: ColorUtil.whitetText,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: ColorUtil.nButtonColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: ColorUtil.nButtonColor,
                                        size: 16,
                                      ),
                                      4.kwidthBox,
                                      Text(
                                        '10',
                                        style: TextStyleUtil.openSans400(
                                            fontSize: 10,
                                            color: ColorUtil.nblackText),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IntrinsicWidth(
                        child: customEventDetailCard(
                          title: '835 13th St. Paso Robles, CA 93446',
                          imgPath: ImageConstant.location,
                        ),
                      ),
                    ),
                    8.kheightBox,
                    Card(
                      elevation: 0,
                      color: ColorUtil.whitetText,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: ColorUtil.nButtonColor),
                          borderRadius: BorderRadius.all(Radius.circular(80))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View Participants',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 14, color: ColorUtil.nblackText),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card customEventDetailCard(
      {String? title,
      String? imgPath,
      Color imageColor = ColorUtil.nButtonColor}) {
    return Card(
      elevation: 0,
      color: ColorUtil.whitetText,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorUtil.nButtonColor),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          children: [
            Image.asset(
              imgPath!,
              color: imageColor,
            ),
            4.kwidthBox,
            Text(
              title!,
              style: TextStyleUtil.openSans400(
                  fontSize: 10, color: ColorUtil.nblackText),
            )
          ],
        ),
      ),
    );
  }
}
