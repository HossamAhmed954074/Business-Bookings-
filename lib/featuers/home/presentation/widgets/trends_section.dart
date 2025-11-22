import 'package:bussines_booking/featuers/home/presentation/widgets/weekly_trends_chart.dart';
import 'package:flutter/material.dart';

class TrendsSection extends StatelessWidget {
  const TrendsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weekly Booking Trends',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Overview of bookings throughout the week',
            style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 24),
          const WeeklyTrendsChart(),
          const SizedBox(height: 16),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3B82F6),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Bookings',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
