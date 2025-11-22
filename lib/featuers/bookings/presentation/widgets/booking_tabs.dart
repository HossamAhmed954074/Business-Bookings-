import 'package:flutter/material.dart';

class BookingTabs extends StatelessWidget {
  const BookingTabs({
    required this.selectedIndex,
    required this.onTabSelected,
    super.key,
  });
  final int selectedIndex;
  final void Function(int) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TabButton(
          label: 'Daily Bookings',
          isSelected: selectedIndex == 0,
          onTap: () => onTabSelected(0),
        ),
        const SizedBox(width: 12),
        _TabButton(
          label: 'Weekly Bookings',
          isSelected: selectedIndex == 1,
          onTap: () => onTabSelected(1),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
