import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/booking.dart';
import '../widgets/booking_tabs.dart';
import '../widgets/bookings_table.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int _selectedTabIndex = 0;

  List<BookingEntity>? _bookings;

  void _handleConfirm(BookingEntity booking) {
    // TODO: Implement confirm logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Confirmed booking for ${booking.sessionName}')),
    );
  }

  void _handleCancel(BookingEntity booking) {
    // TODO: Implement cancel logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cancelled booking for ${booking.sessionName}')),
    );
  }

  String _getTodayDateString() {
    final now = DateTime.now();
    final formatter = DateFormatter();
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bookings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          BookingTabs(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          const SizedBox(height: 24),
          Text(
            "Today's Bookings (${_getTodayDateString()})",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 400,
            width: double.infinity,

            child: SingleChildScrollView(
              child: BookingsTable(
                bookings: _bookings!,
                onConfirm: _handleConfirm,
                onCancel: _handleCancel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateFormatter {
  String format(DateTime date) {
    final dayOfWeek = DateFormat('EEEE').format(date);
    final month = DateFormat('MMMM').format(date);
    final day = date.day;
    return '$dayOfWeek, $month $day';
  }
}
