import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/home/controllers/home_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_widget.dart';
import 'package:noch/app/services/text_style_util.dart';

class NotificationView extends GetView<HomeController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Notification',
            style: TextStyleUtil.openSans600(fontSize: 18),
          ),
          backgroundColor: ColorUtil.ntransparentpage,
          elevation: 0,
          leading: IconButton(
            onPressed: controller.toggleNotificationVisibility,
            icon: Icon(
              Icons.arrow_back,
              color: ColorUtil.whitetText,
            ),
          )),
      backgroundColor: ColorUtil.ntransparentpage,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Today ',
                        style: TextStyleUtil.openSans600(fontSize: 18),
                      ),
                    ),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Past 7 days',
                        style: TextStyleUtil.openSans600(fontSize: 18),
                      ),
                    ),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Past 30 days',
                        style: TextStyleUtil.openSans600(fontSize: 18),
                      ),
                    ),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                    NCustomCard(
                        title: 'Irina_sonya',
                        subtitle: 'Irish commented on your post.',
                        imgpath: ImageConstant.profileImg1,
                        isIcon: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar:
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //   child: TextFormField(
      //     decoration: InputDecoration(
      //       contentPadding:
      //           const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      //       hintText: 'Enter your comment',
      //       hintStyle: TextStyleUtil.openSans400(color: ColorUtil.blackgrey),
      //       filled: true,
      //       fillColor: ColorUtil.whitetText,
      //       enabledBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(24)),
      //         borderSide: BorderSide(color: Colors.transparent),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(24)),
      //         borderSide: BorderSide(color: Colors.transparent),
      //       ),
      //     ),
      //     style: TextStyleUtil.openSans400(
      //         fontSize: 14, color: ColorUtil.nblackText), // Text input style
      //   ),
      // ),
    );
  }
}
