import 'package:flutter/material.dart';
import 'package:bussines_booking/featuers/classess/presentation/widgets/action_button.dart';

class ClassTableRow extends StatelessWidget {
  const ClassTableRow({
    required this.className,
    required this.trainer,
    required this.capacity,
    required this.dateTime,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });
  final String className;
  final String trainer;
  final int capacity;
  final String dateTime;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        children: [
          _buildCell(className, flex: 3, fontWeight: FontWeight.w500),
          _buildCell(trainer, flex: 2, color: Colors.grey.shade700),
          _buildCell(capacity.toString(), flex: 1, color: Colors.grey.shade700),
          _buildCell(dateTime, flex: 3, color: Colors.grey.shade700),
          _buildActionsCell(),
        ],
      ),
    );
  }

  Widget _buildCell(
    String text, {
    required int flex,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: color ?? Colors.black87,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildActionsCell() {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          ActionButton(
            icon: Icons.edit_outlined,
            label: 'Edit',
            color: const Color(0xFF00A6FF),
            onTap: onEdit,
          ),
          const SizedBox(width: 12),
          ActionButton(
            icon: Icons.delete_outline,
            label: 'Delete',
            color: const Color(0xFFFF4757),
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}
