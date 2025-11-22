import 'package:bussines_booking/featuers/auth/presentation/widgets/business_portal_logo.dart';
import 'package:bussines_booking/featuers/slider_menue/presentation/widgets/sidebar_menu_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardSidebar extends StatefulWidget {
  DashboardSidebar({required this.selectedIndex, super.key});
  Function(int) selectedIndex;

  @override
  State<DashboardSidebar> createState() => _DashboardSidebarState();
}

class _DashboardSidebarState extends State<DashboardSidebar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFFF9FAFB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo section
          Container(
            padding: const EdgeInsets.all(24),
            child: const BusinessPortalLogo(),
          ),
          const Divider(height: 1, color: Color(0xFFE5E7EB)),
          const SizedBox(height: 8),

          // Menu items
          SidebarMenuItem(
            icon: Icons.dashboard,
            label: 'Dashboard',
            isSelected: selectedIndex == 0,
            onTap: () {
              widget.selectedIndex(0);
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          SidebarMenuItem(
            icon: Icons.book_online,
            label: 'Bookings',
            isSelected: selectedIndex == 1,
            onTap: () {
              widget.selectedIndex(1);
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          SidebarMenuItem(
            icon: Icons.calendar_today,
            label: 'Class Schedules',
            isSelected: selectedIndex == 2,
            onTap: () {
              widget.selectedIndex(2);
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
          SidebarMenuItem(
            icon: Icons.notifications,
            label: 'Notifications / Logs',
            isSelected: selectedIndex == 3,
            onTap: () {
              widget.selectedIndex(3);
              setState(() {
                selectedIndex = 3;
              });
            },
          ),

          const Spacer(),

          // Footer
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              '© 2025 Business Portal',
              style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<Function(int p1)>.has(
        'selectedIndex',
        widget.selectedIndex,
      ),
    );
  }
}
