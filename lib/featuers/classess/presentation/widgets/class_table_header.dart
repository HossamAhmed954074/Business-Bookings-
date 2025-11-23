import 'package:flutter/material.dart';

class ClassTableHeader extends StatelessWidget {
  const ClassTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          _buildHeaderCell('Class Name', flex: 3),
          _buildHeaderCell('Trainer', flex: 2),
          _buildHeaderCell('Capacity', flex: 1),
          _buildHeaderCell('Date & Time', flex: 3),
          _buildHeaderCell('Actions', flex: 2),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String title, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
