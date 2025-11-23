import 'package:flutter/material.dart';

import 'mark_as_read_button.dart';
import 'notification_content.dart';
import 'notification_icon.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.iconType,
    required this.userName,
    required this.action,
    required this.className,
    required this.classLevel,
    required this.timeInfo,
    required this.onMarkAsRead,
    super.key,
  });
  final NotificationIconType iconType;
  final String userName;
  final String action;
  final String className;
  final String classLevel;
  final String timeInfo;
  final VoidCallback onMarkAsRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationIcon(type: iconType),
          const SizedBox(width: 12),
          Expanded(
            child: NotificationContent(
              userName: userName,
              action: action,
              className: className,
              classLevel: classLevel,
              timeInfo: timeInfo,
            ),
          ),
          const SizedBox(width: 12),
          MarkAsReadButton(onPressed: onMarkAsRead),
        ],
      ),
    );
  }
}
