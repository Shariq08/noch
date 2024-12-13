import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/about_restaurant/views/more_about_restaurant_view.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/about_restaurant_controller.dart';

class AboutRestaurantView extends GetView<AboutRestaurantController> {
  const AboutRestaurantView({super.key});
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
          appBar: NochAppbar(title: 'About restaurant'),
          body: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Stack(children: [
                          SizedBox(
                            width: 90.kw,
                            height: 86.kh,
                            child: Container(
                              height: 80.kh,
                              width: 80.kw,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtil.restrReviewProfile),
                              child: Center(
                                child: Text(
                                  'H A T C H',
                                  style: TextStyleUtil.openSans700(
                                      fontSize: 12.6,
                                      color: ColorUtil.nblackText2),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  starCard(),
                                  2.kwidthBox,
                                  starCard(),
                                  2.kwidthBox,
                                  starCard(),
                                  2.kwidthBox,
                                  starCard(),
                                  2.kwidthBox,
                                  starCard(),
                                ],
                              ))
                        ]),
                        30.kwidthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  connectCard(imgpath: ImageConstant.call),
                                  connectCard(imgpath: ImageConstant.mail),
                                  connectCard(imgpath: ImageConstant.www),
                                  ClipOval(
                                      child: Image.asset(
                                    ImageConstant.restrCard2,
                                    height: 32.kh,
                                    width: 32.kw,
                                    fit: BoxFit.cover,
                                  )),
                                ],
                              ),
                              8.kheightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ratingChip(
                                    onTap: () {
                                      Get.toNamed('/restaurant-review');
                                    },
                                    imgpath: ImageConstant.nochFork,
                                    title: '4.5',
                                  ),
                                  ratingChip(
                                    onTap: () {},
                                    imgpath: ImageConstant.yelp,
                                    title: '4.5',
                                  ),
                                  ratingChip(
                                    onTap: () {},
                                    imgpath: ImageConstant.googleLogo,
                                    title: '4.5',
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    24.kheightBox,
                    Container(
                      height: 37,
                      width: 380,
                      decoration: BoxDecoration(
                          color: ColorUtil.whitetText,
                          borderRadius: BorderRadius.all(Radius.circular(80))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '835 13th St. Paso Robles, CA 93446',
                              style: TextStyleUtil.openSans400(
                                  fontSize: 14, color: ColorUtil.nblackText),
                            ),
                            GestureDetector(
                                onTap: () {
                                  controller.openMap(35.628063, -120.689270);
                                },
                                child: Image.asset(ImageConstant.direction))
                          ],
                        ),
                      ),
                    ),
                    16.kheightBox,
                    SizedBox(
                      width: 324.w,
                      height: 141.kh,
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
                    16.kheightBox,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.RESTAURANT_MENU);
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorUtil.nButtonColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            color: ColorUtil.nButtonColorLight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Text(
                                'Menu',
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText),
                              ),
                            ),
                          ),
                        ),
                        8.kwidthBox,
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.EVENTS);
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorUtil.nButtonColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            color: ColorUtil.nButtonColorLight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Text(
                                'Event',
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    16.kheightBox,
                    Text(
                      'Subscriptions',
                      style: TextStyleUtil.openSans600(
                          color: ColorUtil.nblackText),
                    ),
                    8.kheightBox,
                    Row(
                      children: [
                        customChip(
                          title: r'$100/ month',
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    FractionallySizedBox(
                                      heightFactor: 1.5,
                                      child: Container(
                                        width: 100.w,
                                        height: 612.kh,
                                        decoration: BoxDecoration(
                                            color: ColorUtil.whitetrnsprnt,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24),
                                                topRight: Radius.circular(24))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0, vertical: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.close,
                                                        color: ColorUtil
                                                            .nblackText,
                                                      ))
                                                ],
                                              ),
                                              Center(
                                                child: Text(
                                                  'Restaurant subscription',
                                                  style:
                                                      TextStyleUtil.openSans600(
                                                          fontSize: 18,
                                                          color: ColorUtil
                                                              .nblackText),
                                                ),
                                              ),
                                              24.kheightBox,
                                              Text(
                                                "What's included",
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        color: ColorUtil
                                                            .nblackText),
                                              ),
                                              8.kheightBox,
                                              subcriptionInclude(
                                                  title: 'Discounted Rates'),
                                              8.kheightBox,
                                              subcriptionInclude(
                                                  title:
                                                      'Preferred Reservations:'),
                                              8.kheightBox,
                                              subcriptionInclude(
                                                  title:
                                                      'Free Desserts or Appetizers'),
                                              8.kheightBox,
                                              subcriptionInclude(
                                                  title:
                                                      'Exclusive Menu Items:'),
                                              8.kheightBox,
                                              subcriptionInclude(
                                                  title:
                                                      'Monthly Specials and Events:'),
                                              24.kheightBox,
                                              Text(
                                                "Get credit rewards",
                                                style:
                                                    TextStyleUtil.openSans600(
                                                        color: ColorUtil
                                                            .nblackText),
                                              ),
                                              8.kheightBox,
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth: 311.kw),
                                                child: Text(
                                                  'Instant Credits: Subscribers will receive the subscription amount plus a percentage dollar amount deposited into their wallet for immediate use. The subscription amount will be charged to their card on the first of each month.',
                                                  style:
                                                      TextStyleUtil.openSans400(
                                                          fontSize: 14,
                                                          color: ColorUtil
                                                              .nblackText),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 6,
                                                ),
                                              ),
                                              16.kheightBox,
                                              Center(
                                                child: ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 202.kw),
                                                  child: Text(
                                                    r'$100 you get $100 + 10% credit back to your wallet',
                                                    style: TextStyleUtil
                                                        .openSans600(
                                                            fontSize: 16,
                                                            color: ColorUtil
                                                                .nblackText),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                  ),
                                                ),
                                              ),
                                              24.kheightBox,
                                              Row(
                                                children: [
                                                  expandedButton(
                                                    title:
                                                        r'Get Subscription $100',
                                                    onPressed: () {},
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                        ),
                        customChip(title: r'$50/month', onTap: () {})
                      ],
                    ),
                    16.kheightBox,
                    Text(
                      'Features',
                      style: TextStyleUtil.openSans600(
                          color: ColorUtil.nblackText),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        customChip(title: 'Kosher'),
                        customChip(title: 'Contemporary'),
                        customChip(title: 'Table'),
                        customChip(title: 'Casual'),
                        customChip(title: '12 -11:30 pm'),
                        customChip(title: 'Premium')
                      ],
                    ),
                    16.kheightBox,
                    Row(
                      children: [
                        expandedButton(
                            onPressed: () {
                              Get.to(() => MoreAboutRestaurantView());
                            },
                            title: 'More about us')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row subcriptionInclude({String? title}) {
    return Row(
      children: [
        Icon(Icons.check_circle),
        8.kwidthBox,
        Text(
          title!,
          style: TextStyleUtil.openSans600(color: ColorUtil.nblackText),
        ),
      ],
    );
  }

  Widget customChip({String? title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        color: ColorUtil.whitetText,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            title!,
            style: TextStyleUtil.openSans600(color: ColorUtil.nblackText),
          ),
        ),
      ),
    );
  }

  InkWell ratingChip(
      {required String imgpath,
      required String title,
      required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 29.kh,
        width: 60.kw,
        decoration: BoxDecoration(
            color: ColorUtil.nButtonColorLight2,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgpath,
                height: 18.kh,
                width: 18.kw,
              ),
              4.kwidthBox,
              Text(
                title,
                style: TextStyleUtil.openSans400(
                    fontSize: 10, color: ColorUtil.nblackText),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card connectCard({String? imgpath}) {
    return Card(
      elevation: 0,
      shape: CircleBorder(),
      color: ColorUtil.nButtonColor,
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            imgpath!,
            height: 13.kh,
            width: 13.kw,
            color: ColorUtil.nblackText,
          )),
    );
  }

  Widget starCard() {
    return Container(
      height: 16.kh,
      width: 16.kw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: ColorUtil.nButtonColor),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          Icons.star,
          color: ColorUtil.nblackText,
          size: 12,
        ),
      ),
    );
  }
}
