import 'package:flutter/material.dart';

import '../../domain/entities/booking.dart';
import 'booking_action_button.dart';
import 'booking_status_badge.dart';

class BookingTableRow extends StatelessWidget {
  const BookingTableRow({
    required this.booking,
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });
  final Booking booking;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              booking.customerName,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              booking.className,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(booking.time, style: const TextStyle(fontSize: 14)),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: BookingStatusBadge(status: booking.status),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                BookingActionButton(
                  label: 'Confirm',
                  onPressed: onConfirm,
                  isPrimary: true,
                ),
                const SizedBox(width: 8),
                BookingActionButton(label: 'Cancel', onPressed: onCancel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
