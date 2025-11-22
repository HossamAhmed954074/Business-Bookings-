import 'package:bussines_booking/featuers/bookings/presentation/screens/bookings_screen.dart';
import 'package:bussines_booking/featuers/classess/presentation/screens/class_schedules_screen.dart';
import 'package:bussines_booking/featuers/home/presentation/screens/home_screen.dart';
import 'package:bussines_booking/featuers/notifications/presentation/screens/notifications_screen.dart';
import 'package:bussines_booking/featuers/slider_menue/presentation/widgets/dashboard_header.dart';
import 'package:bussines_booking/featuers/slider_menue/presentation/widgets/dashboard_sidebar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SlideScreen extends StatefulWidget {
  const SlideScreen({super.key});

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  int selectedIndex = 0;
  List<String> headerTitels = const [
    'Dashboard',
    'Bookings',
    'Class Schedules',
    'Notifications',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Row(
        children: [
          // Sidebar
          DashboardSidebar(
            selectedIndex: (v) {
              selectedIndex = v;
              setState(() {});
            },
          ),

          // Main content
          Expanded(
            child: Column(
              children: [
                // Header
                DashboardHeader(title: headerTitels[selectedIndex]),

                // Content area
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: selectedIndex == 0
                        ? const HomeScreen()
                        : selectedIndex == 1
                        ? const BookingsScreen()
                        : selectedIndex == 2
                        ? const ClassSchedulesScreen()
                        : const NotificationsScreen(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('selectedIndex', selectedIndex));
    properties.add(IterableProperty<String>('headerTitels', headerTitels));
  }
}
