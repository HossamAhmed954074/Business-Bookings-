import 'package:flutter/material.dart';

class NotificationsTabBar extends StatelessWidget {
  const NotificationsTabBar({
    required this.notificationCount,
    required this.selectedIndex,
    required this.onTabSelected,
    super.key,
  });
  final int notificationCount;
  final int selectedIndex;
  final void Function(int) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              label: 'Notifications ($notificationCount)',
              isSelected: selectedIndex == 0,
              onTap: () => onTabSelected(0),
            ),
          ),
          Expanded(
            child: _TabButton(
              label: 'Activity Logs',
              isSelected: selectedIndex == 1,
              onTap: () => onTabSelected(1),
            ),
          ),
        ],
      ),
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected
                  ? const Color(0xFF1A1A1A)
                  : const Color(0xFF757575),
            ),
          ),
        ),
      ),
    );
  }
}
