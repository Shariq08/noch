import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:noch/app/constants/image_constant.dart';

class DeliveryController extends GetxController {
  final nameController = TextEditingController();
  final apartmentController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final instructionsController = TextEditingController();
  var addressList = <Map<String, String>>[].obs;
  RxMap<int, int> cartSizes = <int, int>{}.obs;
  var isfeedAmericaselected = false.obs;
  String formatAddress() {
    return "${nameController.text} ${phoneController.text}, ${apartmentController.text} ${streetController.text}, ${cityController.text}, ${postalCodeController.text}";
  }

  void saveAddress(Map<String, String> selectedAddress) {
    addressList.add(selectedAddress);
  }

  // void saveAddress() {
  //   var selectedAddress = {
  //     "name": "Ted Wallace",
  //     "phone": "+1-12345-12345",
  //     "address": "123 Broadway, New York, NY 10006"
  //   };
  //   // Map<String, String> selectedAddress = {
  //   //   "name": nameController.text,
  //   //   "phone": phoneController.text,
  //   //   "address":
  //   //       "${apartmentController.text} ${streetController.text}, ${cityController.text}, ${postalCodeController.text}",
  //   // };

  //   addressList.add(selectedAddress);
  // }

  void incrementCartSize(int index) {
    cartSizes[index] = (cartSizes[index] ?? 0) + 1;
  }

  void decrementCartSize(int index) {
    if ((cartSizes[index] ?? 0) > 0) {
      cartSizes[index] = (cartSizes[index] ?? 0) - 1;
    }
  }

  void togglefeedAmericaSelection() {
    isfeedAmericaselected.value = !isfeedAmericaselected.value;
  }

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
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    apartmentController.dispose();
    streetController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    phoneController.dispose();
    instructionsController.dispose();
  }
}
