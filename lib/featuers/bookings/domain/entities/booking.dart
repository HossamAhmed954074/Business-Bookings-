enum BookingStatus { confirmed, pending, cancelled }

class Booking {
  final String customerName;
  final String className;
  final String time;
  final BookingStatus status;

  const Booking({
    required this.customerName,
    required this.className,
    required this.time,
    required this.status,
  });
}
