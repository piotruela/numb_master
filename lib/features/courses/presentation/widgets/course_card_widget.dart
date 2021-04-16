import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:numb_master/features/courses/domain/entities/course.dart';

class CourseCardWidget extends StatelessWidget {
  final Course course;

  const CourseCardWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildCardDecoration(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
            child: Flag(course.languageCode, width: 100),
          ),
          Text(
            course.languageName,
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 40.0)
        ],
      ),
    );
  }

  BoxDecoration _buildCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}