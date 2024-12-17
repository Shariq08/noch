import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:intl/intl.dart';

class CartController extends GetxController {
  RxMap<int, int> cartSizes = <int, int>{}.obs;
  var selectedDay = (-1).obs;
  var selectedTime = ''.obs;
  var isExpanded = false.obs;

  var selectedPaymentOption = ''.obs;

  void updateSelectedPayment(String option) {
    if (selectedPaymentOption.value == option) {
      selectedPaymentOption.value = '';
    } else {
      selectedPaymentOption.value = option;
    }
  }

  void updateTime(DateTime time) {
    selectedTime.value = DateFormat.jm().format(time);
  }

  void incrementCartSize(int index) {
    cartSizes[index] = (cartSizes[index] ?? 0) + 1;
  }

  void decrementCartSize(int index) {
    if ((cartSizes[index] ?? 0) > 0) {
      cartSizes[index] = (cartSizes[index] ?? 0) - 1;
    }
  }

  void toggleDayPref(int index) {
    selectedDay.value = index;
    isExpanded.value = false;
  }

  List<String> daypref = ['Today', 'Tommorow', '5th December 2024'];

  List cartList = [
    {
      "title": "Hatch Burger",
      "details": "extra bacon, no onions",
      "imgpath": ImageConstant.cartfood,
      "price": '30'
    },
    {
      "title": "Cappuccino",
      "details": "Extra coffee, no sugar",
      "imgpath": ImageConstant.cartfood,
      "price": '30'
    },
  ];
}
