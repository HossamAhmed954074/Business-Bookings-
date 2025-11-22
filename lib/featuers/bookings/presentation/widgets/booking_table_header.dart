import 'package:flutter/material.dart';

class BookingTableHeader extends StatelessWidget {
  const BookingTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Customer Name',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Class',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Time',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Actions',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
