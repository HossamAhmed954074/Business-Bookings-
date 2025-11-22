import 'package:flutter/material.dart';

class SidebarMenuItem extends StatefulWidget {
  const SidebarMenuItem({
    required this.icon,
    required this.label,
    super.key,
    this.isSelected,
    this.onTap,
  });
  final IconData icon;
  final String label;
  final bool? isSelected;
  final VoidCallback? onTap;

  @override
  State<SidebarMenuItem> createState() => _SidebarMenuItemState();
}

class _SidebarMenuItemState extends State<SidebarMenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: widget.isSelected ?? false
              ? Colors.blueAccent[100]
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(widget.icon, size: 20, color: const Color(0xFF374151)),
            const SizedBox(width: 12),
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
