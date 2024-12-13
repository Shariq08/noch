import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';

class RestaurantMenuController extends GetxController {
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

  final count = 0.obs;

  void increment() => count.value++;
}
