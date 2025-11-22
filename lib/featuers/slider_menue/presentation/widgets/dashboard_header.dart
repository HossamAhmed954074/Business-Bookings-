import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, size: 20),
            onPressed: () {},
            color: const Color(0xFF6B7280),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFFFE4B5),
            child: Text('👤', style: TextStyle(fontSize: 14)),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.logout, size: 20),
            onPressed: () {},
            color: const Color(0xFF6B7280),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
