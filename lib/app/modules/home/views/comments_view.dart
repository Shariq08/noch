import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/home/controllers/home_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_widget.dart';
import 'package:noch/app/services/text_style_util.dart';

class CommentsView extends GetView<HomeController> {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Comments',
            style: TextStyleUtil.openSans600(fontSize: 18),
          ),
          backgroundColor: ColorUtil.ntransparentpage,
          elevation: 0,
          leading: IconButton(
            onPressed: controller.toggleCommentVisibility,
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
                  children: [
                    NCustomCard(
                      title: 'Irina_sonya',
                      subtitle: 'The food looks amazing have to try them.',
                      imgpath: ImageConstant.profileImg1,
                      isIcon: true,
                    ),
                    NCustomCard(
                      title: 'Irina_sonya',
                      subtitle: 'The food looks amazing have to try them.',
                      imgpath: ImageConstant.profileImg1,
                      isIcon: true,
                    ),
                    NCustomCard(
                      title: 'Irina_sonya',
                      subtitle: 'The food looks amazing have to try them.',
                      imgpath: ImageConstant.profileImg1,
                      isIcon: true,
                    ),
                    NCustomCard(
                      title: 'Irina_sonya',
                      subtitle: 'The food looks amazing have to try them.',
                      imgpath: ImageConstant.profileImg1,
                      isIcon: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  hintText: 'Enter your comment',
                  hintStyle: TextStyleUtil.openSans400(
                      color: ColorUtil.blackgrey, fontSize: 14),
                  filled: true,
                  fillColor: ColorUtil.whitetText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                style: TextStyleUtil.openSans400(
                    fontSize: 14,
                    color: ColorUtil.nblackText), // Text input style
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
