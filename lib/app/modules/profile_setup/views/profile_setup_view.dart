import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/onboarding/views/onboarding_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/decoration.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/profile_setup_controller.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});
  @override
  Widget build(BuildContext context) {
    final ProfileSetupController controller = Get.put(ProfileSetupController());

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorUtil.whitetText,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile Setup',
                  style: TextStyleUtil.openSans700(color: ColorUtil.whitetText),
                ),
                Text(
                  'Enter your profile details ',
                  style: TextStyleUtil.openSans400(color: ColorUtil.whitetText),
                ),
                32.kheightBox,
                Center(
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ColorUtil.ncircleavatar,
                          borderRadius: BorderRadius.circular(100)),
                      height: 100.kh,
                      width: 100.kw,
                      child: Obx(() {
                        final image = controller.selectedImage.value;
                        if (image != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(image, fit: BoxFit.cover),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(ImageConstant.user),
                          );
                        }
                      }),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SafeArea(
                                child: Wrap(
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('Camera'),
                                      onTap: () {
                                        Get.find<ProfileSetupController>()
                                            .pickImage(ImageSource.camera);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: Text('Gallery'),
                                      onTap: () {
                                        Get.find<ProfileSetupController>()
                                            .pickImage(ImageSource.gallery);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorUtil.whitetText),
                              color: ColorUtil.nButtonColor,
                              borderRadius: BorderRadius.circular(100)),
                          height: 29.kh,
                          width: 29.kw,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Icon(Icons.add,
                                  size: 16, color: ColorUtil.whitetText)),
                        ),
                      ),
                    ),

                    // OutlinedButton(
                    //   onPressed: () {},
                    //   style: OutlinedButton.styleFrom(
                    //       fixedSize: Size(29.kw, 29.kh),
                    //       shape: CircleBorder(),
                    //       side: BorderSide(color: ColorUtil.whitetText),
                    //       backgroundColor: ColorUtil.nButtonColor),
                    //   child: Icon(
                    //     Icons.add,
                    //     size: 12,
                    //     color: ColorUtil.whitetText,
                    //   ),
                    // )
                  ]),
                ),
                16.kheightBox,
                Center(
                  child: Text(
                    'Take or upload profile photo',
                    style: TextStyleUtil.openSans400(fontSize: 16),
                  ),
                ),
                22.kheightBox,
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Full Name',
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.whitetText),
                            children: [
                          TextSpan(
                              text: '*',
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.ncompulsory))
                        ])),
                    8.kheightBox,
                    TextFormField(
                      style: TextStyleUtil.openSans400(fontSize: 14),
                      onChanged: (value) {},
                      controller: controller.nameController,
                      decoration: textFormInputDecoration('Enter your name'),
                    ),
                    16.kheightBox,
                    RichText(
                        text: TextSpan(
                            text: 'Phone Number',
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.whitetText),
                            children: [
                          TextSpan(
                              text: '*',
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.ncompulsory))
                        ])),
                    8.kheightBox,
                    TextFormField(
                      style: TextStyleUtil.openSans400(fontSize: 14),
                      onChanged: (value) {},
                      controller: controller.phoneController,
                      decoration:
                          textFormInputDecoration('Enter your phone number'),
                    ),
                    16.kheightBox,
                    Text('Bio',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.whitetText)),
                    8.kheightBox,
                    TextFormField(
                      maxLines: 3,
                      style: TextStyleUtil.openSans400(fontSize: 14),
                      onChanged: (value) {},
                      controller: controller.phoneController,
                      decoration: textFormInputDecoration('Add your Bio'),
                    ),
                    16.kheightBox,
                    RichText(
                        text: TextSpan(
                            text: 'Upload Driver’s License',
                            style: TextStyleUtil.openSans600(
                                color: ColorUtil.whitetText),
                            children: [
                          TextSpan(
                              text: '*',
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.ncompulsory))
                        ])),
                    8.kheightBox,
                    GestureDetector(
                      onTap: () {
                        controller.pickFile();
                      },
                      child: Container(
                        height: 160.kh,
                        width: 343.kw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorUtil.nTextForm),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() {
                              final fileName =
                                  controller.selectedFileName.value;
                              return fileName.isNotEmpty
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        "Selected File: $fileName",
                                        style: TextStyleUtil.openSans400(
                                          color: ColorUtil.whitetText,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink();
                            }),
                            Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(ImageConstant.upload),
                                8.kwidthBox,
                                Text(
                                  'Upload driver’s License',
                                  style:
                                      TextStyleUtil.openSans400(fontSize: 16),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                    16.kheightBox,
                    Row(
                      children: [
                        expandedButton(
                            onPressed: () {
                              Get.offNamed('/enable-location');
                            },
                            title: 'Proceed',
                            fontsize: 16),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
