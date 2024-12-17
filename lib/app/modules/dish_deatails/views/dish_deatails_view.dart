import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/dish_deatails_controller.dart';

class DishDeatailsView extends GetView<DishDeatailsController> {
  const DishDeatailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
          appBar: NochAppbar(title: 'Dish Details'),
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
                padding: const EdgeInsets.only(
                    top: 24, bottom: 24, left: 8, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                            child: Image.asset(
                          ImageConstant.menu1,
                          height: 80.kh,
                          width: 80.kw,
                          fit: BoxFit.cover,
                        )),
                        8.kwidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200.kw),
                              child: Text(
                                'Rotisserie Chicken',
                                style: TextStyleUtil.openSans700(
                                    fontSize: 20, color: ColorUtil.nblackText),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            8.kheightBox,
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 236.kw),
                              child: Text(
                                'Half mary’s organic chicken, vanilla-maple slaw & hatch hot sauce',
                                style: TextStyleUtil.openSans400(
                                    fontSize: 12, color: ColorUtil.blackgrey),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            8.kheightBox,
                            Row(
                              children: [
                                Card(
                                  elevation: 0,
                                  color: ColorUtil.whitetText,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 4),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: ColorUtil.nButtonColor,
                                            size: 18,
                                          ),
                                          4.kwidthBox,
                                          Text(
                                            '4.5',
                                            style: TextStyleUtil.openSans400(
                                                fontSize: 12,
                                                color: ColorUtil.nblackText),
                                          ),
                                        ],
                                      )),
                                ),
                                8.kwidthBox,
                                Card(
                                  elevation: 0,
                                  color: ColorUtil.whitetText,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 4),
                                      child: Center(
                                        child: Text(
                                          'Kosher',
                                          style: TextStyleUtil.openSans400(
                                              fontSize: 12,
                                              color: ColorUtil.nblackText),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Ingredients',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    16.kheightBox,
                    Wrap(spacing: 8, runSpacing: 8, children: [
                      ...controller.ingredients.asMap().entries.map(
                        (entry) {
                          String i = entry.value;
                          return Card(
                            elevation: 0,
                            color: ColorUtil.whitetText,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8),
                              child: Text(i),
                            ),
                          );
                        },
                      )
                    ]),
                    24.kheightBox,
                    Text(
                      'Ratings & Reviews',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    8.kheightBox,
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sam Smith',
                                  style: TextStyleUtil.openSans600(
                                      color: ColorUtil.nblackText),
                                ),
                                4.kheightBox,
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 280.kw),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet consectetur. Euismod quam risus rhoncus facilisi lectus. ',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 14,
                                        color: ColorUtil.blackgrey),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
