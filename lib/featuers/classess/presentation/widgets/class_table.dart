import 'package:flutter/material.dart';
import 'package:bussines_booking/featuers/classess/presentation/widgets/class_table_header.dart';
import 'package:bussines_booking/featuers/classess/presentation/widgets/class_table_row.dart';

class ClassTable extends StatelessWidget {
  const ClassTable({required this.classes, super.key});
  final List<ClassData> classes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ClassTableHeader(),
        ...classes.map(
          (classData) => ClassTableRow(
            className: classData.className,
            trainer: classData.trainer,
            capacity: classData.capacity,
            dateTime: classData.dateTime,
            onEdit: () => _handleEdit(context, classData),
            onDelete: () => _handleDelete(context, classData),
          ),
        ),
      ],
    );
  }

  void _handleEdit(BuildContext context, ClassData classData) {
    // TODO: Implement edit functionality
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Edit ${classData.className}')));
  }

  void _handleDelete(BuildContext context, ClassData classData) {
    // TODO: Implement delete functionality
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Class'),
        content: Text(
          'Are you sure you want to delete ${classData.className}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${classData.className} deleted')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class ClassData {
  const ClassData({
    required this.className,
    required this.trainer,
    required this.capacity,
    required this.dateTime,
  });
  final String className;
  final String trainer;
  final int capacity;
  final String dateTime;
}
