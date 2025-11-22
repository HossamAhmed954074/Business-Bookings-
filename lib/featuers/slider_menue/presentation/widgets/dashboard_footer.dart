import 'package:flutter/material.dart';

class DashboardFooter extends StatelessWidget {
  const DashboardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const Text(
            '© 2025 Business Portal. All rights reserved.',
            style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ),
              const Text(
                '|',
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Terms of Service',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
