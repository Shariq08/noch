import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/custom_card.dart';
import 'package:noch/app/services/text_style_util.dart';

class PaymentConfirmedView extends GetView {
  const PaymentConfirmedView({super.key});
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
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Text(
              'Booking confirmation',
              style: TextStyleUtil.openSans600(fontSize: 18),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: ConfirmationCard(
                title: 'Your booking was \n successfully submitted',
                subtitle:
                    'you can check order status from my orders in profile section',
              ),
            ),
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
                    title: 'Back to Restaurant details',
                    onPressed: () {
                      Get.offAllNamed(Routes.RESTAURANT_DETAILS);
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}