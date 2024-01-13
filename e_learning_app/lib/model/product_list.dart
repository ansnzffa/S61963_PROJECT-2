import 'package:e_learning_app/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final Product product;

  ProductListScreen({Key? key, required this.product}) : super(key: key);

  // Dummy data for courses
  final List<Course> graphicDesignCourses = [
    Course(
      title: 'Introduction to Graphic Design',
      instructor: 'John Doe',
      timetable: 'Monday, Wednesday, Friday - 10:00 AM to 12:00 PM',
    ),
    Course(
      title: 'Advanced Graphic Design Techniques',
      instructor: 'Jane Smith',
      timetable: 'Tuesday, Thursday - 2:00 PM to 4:00 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: ListView.builder(
        itemCount: graphicDesignCourses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(graphicDesignCourses[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Instructor: ${graphicDesignCourses[index].instructor}'),
                  Text('Timetable: ${graphicDesignCourses[index].timetable}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Course {
  final String title;
  final String instructor;
  final String timetable;

  Course({
    required this.title,
    required this.instructor,
    required this.timetable,
  });
}

