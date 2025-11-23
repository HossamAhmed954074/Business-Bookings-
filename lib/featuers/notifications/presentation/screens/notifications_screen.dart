import 'package:flutter/material.dart';

import '../widgets/notification_card.dart';
import '../widgets/notification_icon.dart';
import '../widgets/notifications_header.dart';
import '../widgets/notifications_tab_bar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedTabIndex = 0;

  // Sample notification data
  final List<NotificationData> _notifications = [
    NotificationData(
      iconType: NotificationIconType.bell,
      userName: 'Alice Johnson',
      action: 'New Booking Confirmed',
      className: 'Yoga Fundamentals',
      classLevel: 'Beginner',
      timeInfo: '5 minutes ago',
    ),
    NotificationData(
      iconType: NotificationIconType.calendar,
      userName: 'Bob Williams',
      action: 'New Booking Confirmed',
      className: 'Pilates Advanced',
      classLevel: 'Studio 2',
      timeInfo: 'Yesterday at 3:00 PM',
    ),
    NotificationData(
      iconType: NotificationIconType.bell,
      userName: 'Charlie Brown',
      action: 'New Booking Confirmed',
      className: 'Spin Class',
      classLevel: 'Morning',
      timeInfo: 'March 10, 2024',
    ),
    NotificationData(
      iconType: NotificationIconType.calendar,
      userName: 'Diana Prince',
      action: 'New Booking Confirmed',
      className: 'Martial Arts',
      classLevel: 'Intermediate',
      timeInfo: 'March 8, 2024',
    ),
    NotificationData(
      iconType: NotificationIconType.bell,
      userName: 'Ethan Hunt',
      action: 'New Booking Confirmed',
      className: 'Cardio Kickboxing',
      classLevel: '',
      timeInfo: 'March 7, 2024',
    ),
  ];

  void _handleMarkAsRead(int index) {
    // Handle mark as read logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Marked notification from ${_notifications[index].userName} as read',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NotificationsHeader(),
        const SizedBox(height: 12),
        NotificationsTabBar(
          notificationCount: _notifications.length,
          selectedIndex: _selectedTabIndex,
          onTabSelected: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height - 250,
          child: _selectedTabIndex == 0
              ? _buildNotificationsList()
              : _buildActivityLogs(),
        ),
      ],
    );
  }

  Widget _buildNotificationsList() {
    return ListView.builder(
      itemCount: _notifications.length,
      padding: const EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) {
        final notification = _notifications[index];
        return NotificationCard(
          iconType: notification.iconType,
          userName: notification.userName,
          action: notification.action,
          className: notification.className,
          classLevel: notification.classLevel,
          timeInfo: notification.timeInfo,
          onMarkAsRead: () => _handleMarkAsRead(index),
        );
      },
    );
  }

  Widget _buildActivityLogs() {
    return const Center(
      child: Text(
        'Activity Logs',
        style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
      ),
    );
  }
}

class NotificationData {
  NotificationData({
    required this.iconType,
    required this.userName,
    required this.action,
    required this.className,
    required this.classLevel,
    required this.timeInfo,
  });
  final NotificationIconType iconType;
  final String userName;
  final String action;
  final String className;
  final String classLevel;
  final String timeInfo;
}
