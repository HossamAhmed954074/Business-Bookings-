import 'package:flutter/material.dart';

import '../../domain/entities/booking.dart';
import 'booking_table_header.dart';
import 'booking_table_row.dart';

class BookingsTable extends StatelessWidget {
  const BookingsTable({
    required this.bookings,
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });
  final List<Booking> bookings;
  final void Function(Booking) onConfirm;
  final void Function(Booking) onCancel;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BookingTableHeader(),
          ...bookings.map(
            (booking) => BookingTableRow(
              booking: booking,
              onConfirm: () => onConfirm(booking),
              onCancel: () => onCancel(booking),
            ),
          ),
        ],
      ),
    );
  }
}
