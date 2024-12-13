import 'package:get/get.dart';
import 'package:noch/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:noch/app/services/storage.dart';

class ReservationController extends GetxController {
  var selectedSlots = <int>[].obs;
  var selectedTablePref = <int>[].obs;

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
}
