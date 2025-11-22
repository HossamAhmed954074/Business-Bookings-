import 'package:bussines_booking/featuers/home/presentation/widgets/dashboard_stats_row.dart';
import 'package:bussines_booking/featuers/home/presentation/widgets/trends_section.dart';
import 'package:bussines_booking/featuers/slider_menue/presentation/widgets/dashboard_footer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard Overview',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
          ),
        ),
        SizedBox(height: 32),
        DashboardStatsRow(),
        SizedBox(height: 32),
        TrendsSection(),
        SizedBox(height: 32),
        DashboardFooter(),
      ],
    );
  }
}
