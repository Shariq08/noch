import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/enable_location/views/enable_location_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_card.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/restaurant_controller.dart';

class RestaurantView extends GetView<RestaurantController> {
  const RestaurantView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantController());
    return Scaffold(
        body: Stack(
      children: [
        // Background Image
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
        // Main Content
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: ColorUtil.whitetrnsprnt,
                      context: context,
                      builder: (BuildContext context) {
                        return FractionallySizedBox(
                          heightFactor: 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorUtil.whitetrnsprnt,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                            height: 612.kh,
                            width: 100.w,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(Icons.cancel_outlined))
                                  ],
                                ),
                                Text(
                                  'Filters',
                                  style: TextStyleUtil.openSans600(
                                      fontSize: 20,
                                      color: ColorUtil.nblackText),
                                ),
                                SizedBox(
                                  height: 550.kh,
                                  width: 100.w,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        16.kheightBox,
                                        FilterCheckCard(
                                          title:
                                              'Search in direction of travel',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                        8.kheightBox,
                                        FilterCheckCard(
                                          title: 'Loyalty Program',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                        8.kheightBox,
                                        FilterCheckCard(
                                          title: 'My Favorites',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                        8.kheightBox,
                                        FilterCheckCard(
                                          title: 'Currently Open',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                        8.kheightBox,
                                        FilterCheckCard(
                                          title: 'Charging station Nearby',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                        8.kheightBox,
                                        FilterCheckCard(
                                          title: 'BOGO',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                        8.kheightBox,
                                        FilterCheckCard(
                                          title: 'Pet friendly',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                        8.kheightBox,
                                        FilterCheckCard(
                                          title: 'Cuisines',
                                          onPressed: () {},
                                          ischeck: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            maximumSize: Size(163.kw, 56.kh),
                                            side: BorderSide(
                                                color: ColorUtil.nButtonColor),
                                            elevation: 0,
                                            backgroundColor:
                                                ColorUtil.nButtonColorLight2,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32.0, vertical: 16),
                                            child: Text(
                                              'Reset',
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 16,
                                                  color: ColorUtil.nblackText),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            maximumSize: Size(163.kw, 56.kh),
                                            elevation: 0,
                                            backgroundColor:
                                                ColorUtil.nButtonColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 32),
                                            child: Text(
                                              'Apply',
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 16,
                                                  color: ColorUtil.nblackText),
                                            ),
                                          ),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(ImageConstant.filter_3),
                ),
              )
            ],
            title: Text(
              'Search',
              style: TextStyleUtil.openSans600(fontSize: 18),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorUtil.whitetText,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  16.kheightBox,

                  // Search Bar
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(ImageConstant.mapPin),
                      hintText: 'Search...',
                      fillColor: ColorUtil.whitetText,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorUtil.whitetrnsprnt),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorUtil.whitetrnsprnt),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorUtil.whitetrnsprnt),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                    ),
                  ),

                  12.kheightBox,

                  RestroCard(
                    onCardTap: () {
                      Get.toNamed('/restaurant-details');
                    },
                    currentIndex: controller.currentIndex,
                    onPressedCamera: controller.openCamera,
                  ),
                  8.kheightBox,
                  RestroCard(
                    onPressedCamera: () {},
                    currentIndex: controller.currentIndex,
                    onCardTap: () {},
                  ),
                  8.kheightBox,
                  RestroCard(
                    onCardTap: () {},
                    currentIndex: controller.currentIndex,
                    onPressedCamera: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class FilterCheckCard extends StatelessWidget {
  String title;
  bool ischeck;
  Function()? onPressed;
  FilterCheckCard(
      {super.key,
      required this.title,
      required this.ischeck,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 0.2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          color: ColorUtil.whitetText,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyleUtil.openSans600(
                      fontSize: 16, color: ColorUtil.nblackText),
                ),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(ischeck
                        ? Icons.check_box
                        : Icons.check_box_outline_blank_outlined))
              ],
            ),
          ),
        ));
  }
}
