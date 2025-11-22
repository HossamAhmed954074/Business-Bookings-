import 'package:flutter/material.dart';

import '../../domain/entities/booking.dart';

class BookingStatusBadge extends StatelessWidget {
  const BookingStatusBadge({required this.status, super.key});
  final BookingStatus status;

  Color _getBackgroundColor() {
    switch (status) {
      case BookingStatus.confirmed:
        return Colors.grey[100]!;
      case BookingStatus.pending:
        return Colors.grey[100]!;
      case BookingStatus.cancelled:
        return Colors.red[50]!;
    }
  }

  Color _getTextColor() {
    switch (status) {
      case BookingStatus.confirmed:
        return Colors.grey[800]!;
      case BookingStatus.pending:
        return Colors.grey[800]!;
      case BookingStatus.cancelled:
        return Colors.red[700]!;
    }
  }

  String _getStatusText() {
    switch (status) {
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _getStatusText(),
        style: TextStyle(
          color: _getTextColor(),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
