import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:noch/app/models/reservation.dart';
import 'package:noch/app/modules/cart/controllers/cart_controller.dart';
import 'package:noch/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:noch/app/modules/reservation/views/reservation_list_view.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/storage.dart';
import 'package:noch/app/services/text_style_util.dart';

class ReservationController extends GetxController {
  var selectedSlots = <int>[].obs;
  var selectedTablePref = <int>[].obs;
  var selectedSeatPref = <int>[].obs;
  var isGathering = false.obs;
  final navigationController = Get.find<NavigationController>();
  final cartController = Get.find<CartController>();
  TextEditingController messageController = TextEditingController();
  RxList<String> messages = <String>[].obs;
  final ImagePicker _picker = ImagePicker();
  var capturedPhoto = Rxn<File>();
  var isTable = false.obs;

  void addMessage(String message) {
    if (message.trim().isNotEmpty) {
      messages.add(message);
    }
  }

  Future<void> openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      capturedPhoto.value = File(photo.path);
      isTable.value = true;
      openBottomSheet();
    }
  }

  void toggleSelection(int index) {
    if (selectedSlots.contains(index)) {
      selectedSlots.remove(index);
    } else {
      selectedSlots.add(index);
    }
  }

  void toggleTablePref(int index) {
    if (selectedTablePref.contains(index)) {
      selectedTablePref.remove(index);
    } else {
      selectedTablePref.add(index);
    }
  }

  void toggleSeatPref(int index) {
    if (selectedSeatPref.contains(index)) {
      selectedSeatPref.remove(index);
    } else {
      selectedSeatPref.add(index);
    }
  }

  List<String> seatpref = [
    'Indoors',
    'Al Fresco',
    'Patio',
    'Near Bar',
    'Near Pool Table'
  ];

  List<String> tablepref = [
    'Al Fresco',
    'Window Seat',
    'Quiet Area',
    'Near Fireplace',
    'Private Room',
    'Near Live Music',
    'Corner Area',
    'Patio',
    'Near Bar',
    "Chef's Table"
  ];
  String getTablePref(int index) {
    List<String> tablepref = [
      'Al Fresco',
      'Window Seat',
      'Quiet Area',
      'Near Fireplace',
      'Private Room',
      'Near Live Music',
      'Corner Area',
      'Patio',
      'Near Bar',
      "Chef's Table"
    ];
    return tablepref[index];
  }

  String getTimeForSlot(int index) {
    List<String> availableTimes = [
      '6:30 PM',
      '7:00 PM',
      '7:30 PM',
      '8:00 PM',
      '8:30 PM',
      '9:00 PM'
    ];
    return availableTimes[index];
  }

  var today = DateTime.now().obs;
  var bookingTitle = 'Normal'.obs;
  var isDateSelected = false.obs;
  var isExpanded = false.obs;
  var iscalendarVisible = false.obs;
  void updateBookingTitle(String newTitle) {
    bookingTitle.value = newTitle;
    if (newTitle == 'Gathering') {
      isGathering.value = true;
    } else {
      isGathering.value = false;
    }
  }

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void toggleCalendarVisibality() {
    iscalendarVisible.value = !iscalendarVisible.value;
  }

  var partySize = 1.obs;

  void incrementPartySize() {
    partySize.value++;
  }

  void decrementPartySize() {
    if (partySize.value > 1) {
      partySize.value--;
    }
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    today.value = day;
    isDateSelected.value = true;
  }

  void goToReservation() {
    navigationController.changePage(3);
    navigationController.resetController();
    Get.offNamed(Routes.NAVIGATION);
  }

  void goToHome() {
    cartController.addOrderItems();
    Get.offNamed(Routes.NAVIGATION);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!navigationController.pageController.hasClients) {
        navigationController.resetController();
      }

      navigationController.changePage(0);
    });
  }

  final reservationsHistory = <ReservationHistory>[
    ReservationHistory(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      status: 'Canceled',
    ),
    ReservationHistory(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      status: 'Completed',
    ),
    ReservationHistory(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      status: 'Completed',
    ),
    ReservationHistory(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      status: 'Completed',
    ),
    ReservationHistory(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      status: 'Completed',
    ),
    ReservationHistory(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      status: 'Completed',
    ),
    ReservationHistory(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      status: 'Completed',
    ),
  ].obs;
  final reservations = <Reservation>[
    Reservation(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
    ),
    Reservation(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: "01/01/2025",
    ),
    Reservation(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: "01/01/2025",
    ),
    Reservation(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: "01/01/2025",
    ),
    Reservation(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: "01/01/2025",
    ),
    Reservation(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: "01/01/2025",
    ),
    Reservation(
      restaurantName: "Outback steak",
      address: "835 13th St. Paso Robles, CA 93446",
      time: "6:30 PM",
      date: "01/01/2025",
    ),
  ].obs;
  String getStatus(String date) {
    final today = DateFormat('MM/dd/yyyy').format(DateTime.now());
    return date == today ? "Ongoing" : "Confirmed";
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: ColorUtil.whitetrnsprnt,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    )),
              ],
            ),
            Text(
              "Your table no. is confirmed",
              style: TextStyleUtil.openSans600(
                  fontSize: 18, color: ColorUtil.nblackText),
            ),
            32.kheightBox,
            Text(
              "Now you can start ordering",
              style: TextStyleUtil.openSans600(
                  fontSize: 16, color: ColorUtil.nblackText),
            ),
            32.kheightBox,
            Row(
              children: [
                expandedButton(
                  title: 'Continue',
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
            48.kheightBox
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
