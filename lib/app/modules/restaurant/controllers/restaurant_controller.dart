import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noch/app/modules/enable_location/views/enable_location_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class RestaurantController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var capturedPhoto = Rxn<File>();
  final currentIndex = 0.obs;
  void updateIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      capturedPhoto.value = File(photo.path);
      openBottomSheet();
    }
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorUtil.whitetrnsprnt,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            24.kheightBox,
            Text(
              "Add Comment",
              style: TextStyleUtil.openSans600(color: ColorUtil.nblackText),
            ),
            53.kheightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Caption / Comment'),
                8.kheightBox,
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                    fillColor: ColorUtil.whitetText,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorUtil.whitetrnsprnt),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtil.whitetrnsprnt,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtil.whitetrnsprnt,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                24.kheightBox,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(163.kw, 56.kh),
                            side: BorderSide(color: ColorUtil.nButtonColor),
                            elevation: 0,
                            backgroundColor: ColorUtil.nButtonColorLight2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16),
                            child: Text(
                              'Reset',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
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
                            backgroundColor: ColorUtil.nButtonColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32),
                            child: Text(
                              'Post',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
                            ),
                          ),
                        )
                      ]),
                )
              ],
            )
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
