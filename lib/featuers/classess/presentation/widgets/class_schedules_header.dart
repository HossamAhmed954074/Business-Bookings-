import 'package:flutter/material.dart';

class ClassSchedulesHeader extends StatelessWidget {
  final VoidCallback onAddClass;

  const ClassSchedulesHeader({super.key, required this.onAddClass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Class Schedules',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          ElevatedButton.icon(
            onPressed: onAddClass,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add New Class'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A6FF),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
