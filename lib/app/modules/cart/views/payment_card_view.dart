import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/cart/views/payment_confirmed_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class PaymentCardView extends GetView {
  const PaymentCardView({super.key});
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
        appBar: NochAppbar(title: 'Card'),
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
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: Card(
                    elevation: 0,
                    color: ColorUtil.whitetText,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: Column(
                        children: [
                          24.kheightBox,
                          Text(
                            'Saved Cards',
                            style: TextStyleUtil.openSans600(
                                fontSize: 16, color: ColorUtil.nblackText),
                          ),
                          16.kheightBox,
                          savedPaymentcard(
                              cardNumber: '**** **** *325',
                              imgpath: ImageConstant.visa),
                          16.kheightBox,
                          savedPaymentcard(
                              cardNumber: '**** **** *112',
                              imgpath: ImageConstant.mastercard)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              36.kheightBox,
              Card(
                elevation: 0,
                color: ColorUtil.whitetrnsprnt,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: Card(
                    elevation: 0,
                    color: ColorUtil.whitetText,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: Column(
                        children: [
                          24.kheightBox,
                          Text(
                            'Add Cards',
                            style: TextStyleUtil.openSans600(
                                fontSize: 16, color: ColorUtil.nblackText),
                          ),
                          16.kheightBox,
                          Card(
                            elevation: 0,
                            color: ColorUtil.whitetText,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ColorUtil.paymentcardbackground,
                                    width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: ColorUtil.paymentcardbackground,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: 8),
                                      child: Image.asset(ImageConstant.visa),
                                    ),
                                  ),
                                  8.kwidthBox,
                                  Text(
                                    'Credit / Debit Card',
                                    style: TextStyleUtil.openSans400(
                                        fontSize: 16,
                                        color: ColorUtil.nblackText),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: ColorUtil.nblackText,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                  title: 'Continue',
                  onPressed: () {
                    Get.to(() => PaymentConfirmedView());
                  },
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Card savedPaymentcard({String? cardNumber, String? imgpath}) {
    return Card(
      elevation: 0,
      color: ColorUtil.whitetText,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorUtil.paymentcardbackground, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          children: [
            Card(
              elevation: 0,
              color: ColorUtil.paymentcardbackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                child: Image.asset(imgpath!),
              ),
            ),
            8.kwidthBox,
            Text(
              cardNumber!,
              style: TextStyleUtil.openSans400(
                  fontSize: 16, color: ColorUtil.nblackText),
            ),
            Spacer(),
            Icon(
              Icons.circle_outlined,
              color: ColorUtil.nButtonColor,
            )
          ],
        ),
      ),
    );
  }
}
