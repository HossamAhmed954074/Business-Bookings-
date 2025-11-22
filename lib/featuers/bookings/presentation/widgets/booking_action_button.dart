import 'package:flutter/material.dart';

class BookingActionButton extends StatelessWidget {
  const BookingActionButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.isPrimary = false,
  });
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: isPrimary ? Colors.blue : Colors.grey[600],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
