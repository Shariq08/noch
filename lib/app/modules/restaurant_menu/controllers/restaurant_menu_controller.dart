import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class RestaurantMenuController extends GetxController {
  late bool isFromPickup;
  late bool isFromDelivery;
  late bool isFromTable;
  var partySize = 1.obs;
  RxMap<int, int> orderSizes = <int, int>{}.obs;
  RxMap<int, bool> showEditIcon = <int, bool>{}.obs;
  RxMap<int, bool> isRestrictItem = <int, bool>{}.obs;
  var isButtonEnabled = false.obs;
  final List<Map<String, dynamic>> addsonItems = [
    {"name": "Extra chicken", "price": 5},
    {"name": "Extra pepperoni", "price": 5},
    {"name": "Extra onion", "price": 5},
    {"name": "Extra tomatoes", "price": 5}
  ];
  final List<Map<String, dynamic>> restrictItems = [
    {"name": "No chicken"},
    {"name": "No bacon"},
    {"name": "No tomatoes"},
    {"name": "No peanuts"}
  ];
  late RxList<int> addonOrderSizes;
  @override
  void onInit() {
    isFromPickup = Get.arguments?['isfromPickup'] ?? false;
    isFromDelivery = Get.arguments?['isfromdelivery'] ?? false;
    isFromTable = Get.arguments?['isfromTable'] ?? false;
    addonOrderSizes = List<int>.filled(addsonItems.length, 0).obs;
    super.onInit();
  }

  void initializeOrderSizes() {
    for (int i = 0; i < menuList.length; i++) {
      orderSizes[i] = 0;
    }
  }

  void incrementOrderSize(BuildContext context, int index) {
    int currentSize = orderSizes[index] ?? 0;

    if (currentSize == 0) {
      orderSizes[index] = 1;
      showEditIcon[index] = true;
      isButtonEnabled.value = true;
    } else {
      _showOrderChoiceModal(context, index);
    }
  }

  void incrementSameOrder(int index) {
    orderSizes[index] = (orderSizes[index] ?? 0) + 1;
    Get.back();
  }

  void _showOrderChoiceModal(BuildContext context, int index) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => Container(
              height: 298.kh,
              width: 100.w,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.close,
                              color: ColorUtil.nblackText,
                            ))
                      ],
                    ),
                    Text(
                      'Add item',
                      style: TextStyleUtil.openSans600(
                          fontSize: 18, color: ColorUtil.nblackText),
                    ),
                    43.kheightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: ElevatedButton(
                              onPressed: () {
                                incrementSameOrder(index);
                              },
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(color: ColorUtil.nButtonColor),
                                elevation: 0,
                                backgroundColor: ColorUtil.nButtonColorLight2,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 0),
                                child: Text(
                                  'Same customization',
                                  style: TextStyleUtil.openSans600(
                                      color: ColorUtil.nblackText),
                                ),
                              ),
                            ),
                          ),
                        )
                        // Expanded(
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       Get.back();
                        //     },

                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           vertical: 16, horizontal: 50),
                        //       child: Text(
                        //         'Reset',
                        //         style: TextStyleUtil.openSans600(
                        //             fontSize: 16, color: ColorUtil.nblackText),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    16.kheightBox,
                    Row(
                      children: [
                        expandedButton(
                          title: 'Add New',
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  void decrementOrderSize(int index) {
    if ((orderSizes[index] ?? 0) > 0) {
      orderSizes[index] = (orderSizes[index] ?? 0) - 1;
    }
    if (orderSizes[index] == 0) {
      showEditIcon[index] = false;
    }
  }

  void incrementAddonSize(int index) {
    addonOrderSizes[index]++;
  }

  void decrementAddonSize(int index) {
    if (addonOrderSizes[index] > 0) {
      addonOrderSizes[index]--;
    }
  }

  void restrictaddonItem(int index) {
    isRestrictItem[index] = !(isRestrictItem[index] ?? false);
  }

  List options = [
    "BOGO",
    "Specials",
    "Appetizers",
    "Entrees",
    "Main Course",
    "Platters",
    "Breakfast",
    "Lunch",
    "Dinner",
    "Kids menu",
    "Happy hour",
    "Vegan",
    "Vegetarian",
    "Kosher"
  ];

  List menuList = [
    {
      "title": "ROTISSERIE CHICKEN",
      "details":
          "Half mary’s organic chicken, vanilla-maple slaw & hatch hot sauce",
      "imgpath": ImageConstant.menu1,
      "price": r'$24',
      "rating": "4.5"
    },
    {
      "title": "ETTO FETTUCCINE",
      "details":
          "Roasted mushrooms, caramelized shallots, chili oil, poached egg, parmesan",
      "imgpath": ImageConstant.menu2,
      "price": r'$24',
      "rating": "4.5"
    },
    {
      "title": "FLAT IRON",
      "details": "Caramelized onion, bacon-onion jam, whipped bleu",
      "imgpath": ImageConstant.menu3,
      "price": r'$18',
      "rating": "4.5"
    },
    {
      "title": "ETTO FETTUCCINE",
      "details":
          "Roasted mushrooms, caramelized shallots, chili oil, poached egg, parmesan",
      "imgpath": ImageConstant.menu4,
      "price": r'$24',
      "rating": "4.5"
    },
    {
      "title": "ROTISSERIE CHICKEN",
      "details":
          "Half mary’s organic chicken, vanilla-maple slaw & hatch hot sauce",
      "imgpath": ImageConstant.menu1,
      "price": r'$24',
      "rating": "4.5"
    },
    {
      "title": "ETTO FETTUCCINE",
      "details":
          "Roasted mushrooms, caramelized shallots, chili oil, poached egg, parmesan",
      "imgpath": ImageConstant.menu2,
      "price": r'$24',
      "rating": "4.5"
    },
    {
      "title": "FLAT IRON",
      "details": "Caramelized onion, bacon-onion jam, whipped bleu",
      "imgpath": ImageConstant.menu3,
      "price": r'$18',
      "rating": "4.5"
    },
    {
      "title": "ETTO FETTUCCINE",
      "details":
          "Roasted mushrooms, caramelized shallots, chili oil, poached egg, parmesan",
      "imgpath": ImageConstant.menu4,
      "price": r'$24',
      "rating": "4.5"
    }
  ];
}
