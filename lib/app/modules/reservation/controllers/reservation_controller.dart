import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:noch/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:noch/app/modules/reservation/views/reservation_list_view.dart';
import 'package:noch/app/routes/app_pages.dart';
import 'package:noch/app/services/storage.dart';

class ReservationController extends GetxController {
  var selectedSlots = <int>[].obs;
  var selectedTablePref = <int>[].obs;
  var selectedSeatPref = <int>[].obs;
  var isGathering = false.obs;
  final navigationController = Get.find<NavigationController>();
  TextEditingController messageController = TextEditingController();
  RxList<String> messages = <String>[].obs;

  void addMessage(String message) {
    if (message.trim().isNotEmpty) {
      messages.add(message);
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
    Get.offNamed('/navigation');
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
}

class Reservation {
  final String restaurantName;
  final String address;
  final String time;
  final String date;

  Reservation({
    required this.restaurantName,
    required this.address,
    required this.time,
    required this.date,
  });
}

class ReservationHistory {
  final String restaurantName;
  final String address;
  final String time;
  final String date;
  final String status;

  ReservationHistory(
      {required this.restaurantName,
      required this.address,
      required this.time,
      required this.date,
      required this.status});
}
