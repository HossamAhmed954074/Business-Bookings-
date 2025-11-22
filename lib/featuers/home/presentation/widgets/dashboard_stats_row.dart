import 'package:bussines_booking/featuers/home/presentation/widgets/stats_card.dart';
import 'package:flutter/material.dart';

class DashboardStatsRow extends StatelessWidget {
  const DashboardStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: StatsCard(
            title: 'Total Bookings Today',
            value: '128',
            icon: Icons.calendar_today,
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: StatsCard(
            title: 'Total Bookings This Week',
            value: '845',
            icon: Icons.calendar_month,
          ),
        ),
      ],
    );
  }
}
