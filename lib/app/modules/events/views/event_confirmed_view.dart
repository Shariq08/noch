import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/events/controllers/events_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/custom_card.dart';
import 'package:noch/app/services/text_style_util.dart';

class EventConfirmedView extends GetView {
  const EventConfirmedView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventsController());
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          ImageConstant.restrback,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: ConfirmationCard(
                    title: 'Your payment was successfully submitted',
                    subtitle:
                        'Hi Nichole, your spot is saved for the Rooftop BBQ Bash!',
                  ),
                ),
              ),
            ],
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
                    title: 'Back to home',
                    onPressed: () {
                      controller.goToHome();
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
