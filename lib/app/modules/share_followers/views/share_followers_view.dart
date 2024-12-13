import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/dish_deatails/views/dish_deatails_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/share_followers_controller.dart';

class ShareFollowersView extends GetView<ShareFollowersController> {
  const ShareFollowersView({super.key});
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
          appBar: NochAppbar(title: 'Share with followers'),
          body: ListView.builder(
            itemCount: controller.followers.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  color: ColorUtil.whitetText,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                          color: ColorUtil.nButtonColor,
                          size: 32,
                        ),
                        16.kwidthBox,
                        ClipOval(
                          child: Image.asset(
                            controller.followers[index]['imgpath'],
                            height: 40.kh,
                            width: 40.kw,
                            fit: BoxFit.fill,
                          ),
                        ),
                        8.kwidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.followers[index]['name'],
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.nblackText),
                            ),
                            Text(
                              controller.followers[index]['city'],
                              style: TextStyleUtil.openSans600(
                                  fontSize: 10, color: ColorUtil.nblackText),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
                color: ColorUtil.whitetText,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  expandedButton(
                    title: 'Share',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
