import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/about_restaurant/views/about_restaurant_view.dart';
import 'package:noch/app/modules/cart/controllers/cart_controller.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class FloatingCart extends StatelessWidget {
  const FloatingCart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Obx(() {
      if (cartController.orderItems.isNotEmpty) {
        print('cart avail');
        return Positioned(
          bottom: 65,
          left: 30,
          child: Card(
            elevation: 0,
            color: ColorUtil.whitetText,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your food is being prepared',
                    style: TextStyleUtil.openSans400(
                        fontSize: 12, color: ColorUtil.nblackText),
                  ),
                  4.kheightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          ImageConstant.restrgallery1,
                          width: 48.kw,
                          height: 48.kh,
                          fit: BoxFit.cover,
                        ),
                      ),
                      7.kwidthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: 21.kh, maxWidth: 137.kw),
                            child: Text(
                              'The Hatch Rotisserrr',
                              style: TextStyleUtil.openSans600(
                                  color: ColorUtil.nblackText),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2 items',
                                style: TextStyleUtil.openSans400(
                                    fontSize: 12, color: ColorUtil.nblackText),
                              ),
                              Text(
                                '  | ',
                                style: TextStyleUtil.openSans400(
                                    fontSize: 12, color: ColorUtil.nblackText),
                              ),
                              Text(
                                'View Menu',
                                style: TextStyleUtil.openSans400(
                                    fontSize: 12, color: ColorUtil.nblackText),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 24,
                              )
                            ],
                          )
                        ],
                      ),
                      15.kwidthBox,
                      Card(
                        elevation: 0,
                        color: ColorUtil.nButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4),
                          child: Column(
                            children: [
                              Text(
                                r'$800',
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText),
                              ),
                              Text(
                                'View order',
                                style: TextStyleUtil.openSans400(
                                    fontSize: 12, color: ColorUtil.nblackText),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        print('cart notavail');
        return SizedBox.shrink();
      }
    });
  }
}
