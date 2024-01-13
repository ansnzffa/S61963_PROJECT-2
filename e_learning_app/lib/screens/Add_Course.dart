import 'dart:math';

import 'package:e_learning_app/screens/course.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:e_learning_app/constant/constants.dart';
import 'package:e_learning_app/screens/edit.dart';

class AddCourseScreen extends StatefulWidget {
  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  List<MyCourse> sampleCourse = []; // Initialize with your data
  List<MyCourse> filteredCourse = []; // Initialize with your data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
        backgroundColor: const Color.fromARGB(255, 210, 164, 218),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: filteredCourse.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  color: getRandomColor(),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                EditScreen(course: filteredCourse[index]),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            int originalIndex =
                                sampleCourse.indexOf(filteredCourse[index]);

                            sampleCourse[originalIndex] = MyCourse(
                              id: sampleCourse[originalIndex].id,
                              title: result[0],
                              content: result[1],
                              modifiedTime: DateTime.now(),
                            );

                            filteredCourse[index] = MyCourse(
                              id: filteredCourse[index].id,
                              title: result[0],
                              content: result[1],
                              modifiedTime: DateTime.now(),
                            );
                          });
                        }
                      },
                      title: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: '${filteredCourse[index].title} \n',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.5),
                            children: [
                              TextSpan(
                                text: filteredCourse[index].content,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    height: 1.5),
                              )
                            ]),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(filteredCourse[index].modifiedTime)}',
                          style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          final result = await confirmDialog(context);
                          if (result != null && result) {
                            deleteCourse(index);
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );

          if (result != null) {
            setState(() {
              sampleCourse.add(MyCourse(
                  id: sampleCourse.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now()));
              filteredCourse = sampleCourse;
            });
          }
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(145, 216, 216, 1),
          icon: const Icon(
            Icons.info,
            color: Colors.grey,
          ),
          title: const Text(
            'Are you sure you want to delete?',
            style: TextStyle(color: Colors.white),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const SizedBox(
                  width: 60,
                  child: Text(
                    'Yes',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const SizedBox(
                  width: 60,
                  child: Text(
                    'No',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  void deleteCourse(int index) {
    // Implement your logic to delete the course
    // This is a placeholder function
  }
}

class EditScreen extends StatelessWidget {
  final MyCourse? course;

  const EditScreen({Key? key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Course'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Edit Screen'),
            if (course != null) ...[
              Text('Course Title: ${course!.title}'),
              Text('Course Content: ${course!.content}'),
            ],
          ],
        ),
      ),
    );
  }
}

class MyCourse {
  final int id;
  final String title;
  final String content;
  final DateTime modifiedTime;

  MyCourse({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}
