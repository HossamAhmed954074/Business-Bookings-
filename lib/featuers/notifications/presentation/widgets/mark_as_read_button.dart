import 'package:flutter/material.dart';

class MarkAsReadButton extends StatelessWidget {
  const MarkAsReadButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text(
        'Mark as Read',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF2196F3),
        ),
      ),
    );
  }
}
