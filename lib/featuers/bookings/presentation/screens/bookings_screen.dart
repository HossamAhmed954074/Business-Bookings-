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

  // Sample data - replace with real data later
  final List<Booking> _sampleBookings = const [
    Booking(
      customerName: 'Alice Johnson',
      className: 'Morning Yoga',
      time: '08:00 AM',
      status: BookingStatus.confirmed,
    ),
    Booking(
      customerName: 'Bob Williams',
      className: 'Spin Class',
      time: '09:30 AM',
      status: BookingStatus.pending,
    ),
    Booking(
      customerName: 'Charlie Brown',
      className: 'Pilates Basics',
      time: '11:00 AM',
      status: BookingStatus.confirmed,
    ),
    Booking(
      customerName: 'Diana Miller',
      className: 'HIIT Training',
      time: '01:00 PM',
      status: BookingStatus.cancelled,
    ),
    Booking(
      customerName: 'Eve Davis',
      className: 'Meditation',
      time: '03:00 PM',
      status: BookingStatus.confirmed,
    ),
  ];

  void _handleConfirm(Booking booking) {
    // TODO: Implement confirm logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Confirmed booking for ${booking.customerName}')),
    );
  }

  void _handleCancel(Booking booking) {
    // TODO: Implement cancel logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cancelled booking for ${booking.customerName}')),
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
                bookings: _sampleBookings,
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
