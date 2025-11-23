import 'package:flutter/material.dart';
import 'package:bussines_booking/featuers/classess/presentation/widgets/available_classes_section.dart';
import 'package:bussines_booking/featuers/classess/presentation/widgets/class_schedules_header.dart';
import 'package:bussines_booking/featuers/classess/presentation/widgets/class_table.dart';

class ClassSchedulesScreen extends StatelessWidget {
  const ClassSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClassSchedulesHeader(onAddClass: () => _handleAddClass(context)),
          const SizedBox(height: 8),
          AvailableClassesSection(
            child: ClassTable(classes: _getSampleClasses()),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _handleAddClass(BuildContext context) {
    // TODO: Navigate to add class screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add New Class functionality')),
    );
  }

  List<ClassData> _getSampleClasses() {
    return const [
      ClassData(
        className: 'Morning Yoga Flow',
        trainer: 'Alice Smith',
        capacity: 20,
        dateTime: 'Monday, 9:00 AM - 10:00 AM',
      ),
      ClassData(
        className: 'Advanced Pilates',
        trainer: 'Bob Johnson',
        capacity: 15,
        dateTime: 'Tuesday, 6:00 PM - 7:00 PM',
      ),
      ClassData(
        className: 'Spin Class Endurance',
        trainer: 'Charlie Brown',
        capacity: 25,
        dateTime: 'Wednesday, 7:00 AM - 8:00 AM',
      ),
      ClassData(
        className: 'Beginner Zumba',
        trainer: 'Diana Miller',
        capacity: 30,
        dateTime: 'Thursday, 5:00 PM - 6:00 PM',
      ),
      ClassData(
        className: 'Kickboxing Fundamentals',
        trainer: 'Frank Green',
        capacity: 18,
        dateTime: 'Friday, 12:00 PM - 1:00 PM',
      ),
    ];
  }
}
