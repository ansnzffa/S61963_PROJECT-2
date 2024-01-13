import 'package:flutter/material.dart';
import 'package:e_learning_app/screens/Add_Course.dart';

class CourseEnrollmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Enrollment'),
        backgroundColor: const Color.fromARGB(255, 210, 164, 218),
      ),
      body: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late String selectedProgram;
  late String selectedinstructor = '';
  late String selectedSchedule;
  late String selectedcourseName;

  List<String> programs = ['Graphic Design', 'Programming', 'UI/UX', 'Finance'];
  List<String> schedules = [
    'Sunday (9.00 a.m -10.00 a.m)',
    'Wednesday (11.00 a.m.-1.00 p.m.)',
    'Friday (8.00 a.m. -10.00 a.m.)'
  ];
  List<String> course = ['Art Design', 'Object Oriented', 'Flutter Framework', 'Account'];
  List<String> instructor = ['Madam Farhana', 'Sir Fathi', 'Sir Helmi', 'Madam Nadh'];

  _RegistrationFormState() {
    selectedProgram = programs[0]; // Initialize with the first program
    selectedSchedule = schedules[0]; // Initialize with the first schedule
    selectedcourseName = course[0]; // Initialize with the first course
    selectedinstructor = instructor[0]; // Initialize with the first instructor
  }

  void _handleEnroll() {
    // Add logic for enrollment here
    // You can access the selectedProgram, selectedSchedule, selectedcourseName, and selectedinstructor variables
    // and perform the enrollment process.
    // For now, we'll just print the selected values.
    print('Enrolling in $selectedProgram - $selectedcourseName with $selectedinstructor at $selectedSchedule');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. What program are you planning to enroll?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButtonFormField(
            value: selectedProgram,
            items: programs.map((program) {
              return DropdownMenuItem(
                value: program,
                child: Text(program),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedProgram = value!;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            '2. Which Course did you choose?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButtonFormField(
            value: selectedcourseName,
            items: course.map((course) {
              return DropdownMenuItem(
                value: course,
                child: Text(course),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedcourseName = value!;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            '3. Choose your instructor',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButtonFormField(
            value: selectedinstructor,
            items: instructor.map((instructor) {
              return DropdownMenuItem(
                value: instructor,
                child: Text(instructor),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedinstructor = value!;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            '4. Choose Time Table',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButtonFormField(
            value: selectedSchedule,
            items: schedules.map((schedule) {
              return DropdownMenuItem(
                value: schedule,
                child: Text(schedule),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSchedule = value!;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _handleEnroll(); // Call the method to handle enrollment
            },
            child: Text('Enroll'),
          ),
        ],
      ),
    );
  }
}
