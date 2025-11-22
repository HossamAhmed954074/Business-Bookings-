import 'package:flutter/material.dart';

class BusinessPortalLogo extends StatelessWidget {
  const BusinessPortalLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1DA1F2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.business, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        const Text(
          'Business Portal',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1DA1F2),
          ),
        ),
      ],
    );
  }
}
