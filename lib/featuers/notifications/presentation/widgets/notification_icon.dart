import 'package:flutter/material.dart';

enum NotificationIconType { bell, calendar }

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({required this.type, super.key});
  final NotificationIconType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(_getIcon(), color: _getIconColor(), size: 20),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case NotificationIconType.bell:
        return const Color(0xFFE3F2FD);
      case NotificationIconType.calendar:
        return const Color(0xFFE3F2FD);
    }
  }

  IconData _getIcon() {
    switch (type) {
      case NotificationIconType.bell:
        return Icons.notifications_outlined;
      case NotificationIconType.calendar:
        return Icons.calendar_today_outlined;
    }
  }

  Color _getIconColor() {
    switch (type) {
      case NotificationIconType.bell:
        return const Color(0xFF2196F3);
      case NotificationIconType.calendar:
        return const Color(0xFF2196F3);
    }
  }
}
