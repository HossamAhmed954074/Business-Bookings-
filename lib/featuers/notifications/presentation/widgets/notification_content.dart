import 'package:flutter/material.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({
    required this.userName,
    required this.action,
    required this.className,
    required this.classLevel,
    required this.timeInfo,
    super.key,
  });
  final String userName;
  final String action;
  final String className;
  final String classLevel;
  final String timeInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 4),
        _buildClassInfo(),
        const SizedBox(height: 6),
        _buildTimeInfo(),
      ],
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Color(0xFF1A1A1A)),
        children: [
          TextSpan(
            text: userName,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: ' - $action',
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildClassInfo() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 12, color: Color(0xFF757575)),
        children: [
          const TextSpan(text: 'Class:'),
          TextSpan(
            text: className,
            style: const TextStyle(color: Color(0xFF2196F3)),
          ),
          TextSpan(
            text: ' [$classLevel]',
            style: const TextStyle(color: Color(0xFF2196F3)),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Text(
      timeInfo,
      style: const TextStyle(fontSize: 11, color: Color(0xFF9E9E9E)),
    );
  }
}
