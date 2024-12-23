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
