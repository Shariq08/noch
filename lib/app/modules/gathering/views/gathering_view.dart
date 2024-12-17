import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/about_restaurant/views/about_restaurant_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/gathering_controller.dart';

class GatheringView extends GetView<GatheringController> {
  const GatheringView({super.key});
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
        appBar: NochAppbar(title: 'Gathering'),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: ColorUtil.whitetrnsprnt,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gathering’s Name',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Gathering’s name',
                          hintStyle: TextStyleUtil.openSans400(
                              fontSize: 14, color: ColorUtil.nblackText),
                          fillColor: ColorUtil.whitetText,
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorUtil.whitetrnsprnt),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80))),
                        ),
                      ),
                      16.kheightBox,
                      Text(
                        'Add description',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Enter description',
                          hintStyle: TextStyleUtil.openSans400(
                              fontSize: 14, color: ColorUtil.nblackText),
                          fillColor: ColorUtil.whitetText,
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorUtil.whitetrnsprnt),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                      ),
                      16.kheightBox,
                      Text(
                        'Guest',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
