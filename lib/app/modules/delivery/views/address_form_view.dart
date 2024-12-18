import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/cart/views/payment_confirmed_view.dart';
import 'package:noch/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/decoration.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class AddressFormView extends GetView {
  const AddressFormView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeliveryController());
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
        backgroundColor: Colors.transparent,
        appBar: NochAppbar(title: 'Add address'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Card(
            color: ColorUtil.whitetrnsprnt,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        controller: controller.nameController,
                        decoration:
                            textformdecorationwithoutborder(hint: 'Enter name'),
                      ),
                      16.kheightBox,
                      Text(
                        'Apartment/Suite/Unit',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        controller: controller.apartmentController,
                        decoration: textformdecorationwithoutborder(
                            hint: 'Enter details'),
                      ),
                      16.kheightBox,
                      Text(
                        'Street  Address',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        controller: controller.streetController,
                        decoration: textformdecorationwithoutborder(
                            hint: 'Enter street address'),
                      ),
                      16.kheightBox,
                      Text(
                        'City',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        controller: controller.cityController,
                        decoration:
                            textformdecorationwithoutborder(hint: 'Enter city'),
                      ),
                      16.kheightBox,
                      Text(
                        'Postal/ZIP code',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        controller: controller.postalCodeController,
                        decoration: textformdecorationwithoutborder(
                            hint: 'Postal/ZIP code'),
                      ),
                      16.kheightBox,
                      Text(
                        'Phone Number',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        controller: controller.phoneController,
                        decoration: textformdecorationwithoutborder(
                            hint: 'Enter phone number'),
                      ),
                      16.kheightBox,
                      Text(
                        'Add special instructions',
                        style: TextStyleUtil.openSans600(
                            color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextField(
                        controller: controller.instructionsController,
                        maxLines: 3,
                        decoration: textformdecorationwithoutborder(
                            radius: 24, hint: 'Add instructions'),
                      ),
                      60.kheightBox,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          height: 80.kh,
          decoration: BoxDecoration(
              color: ColorUtil.whitetText,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                expandedButton(
                  title: 'Proceed',
                  onPressed: () {
                    Map<String, String> newAddress = {
                      "name": "Ted Wallace",
                      "phone": "+1-12345-12345",
                      "address": "123 Broadway, New York, NY 10006"
                    };
                    controller.saveAddress(newAddress);
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
