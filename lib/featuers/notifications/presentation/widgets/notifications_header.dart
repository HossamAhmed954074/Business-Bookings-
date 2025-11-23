import 'package:flutter/material.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Notifications & Activity Logs',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A1A1A),
        ),
      ),
    );
  }
}
