import 'package:e_learning_app/components/appbar.dart';
import 'package:e_learning_app/components/category.dart';
import 'package:e_learning_app/components/sorting.dart';
import 'package:e_learning_app/constant/constants.dart';
import 'package:e_learning_app/main.dart';
import 'package:e_learning_app/screens/course_enrollment.dart';
//import 'package:e_learning_app/screens/course_enrollment.dart';
import 'package:e_learning_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/model/product_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Learning App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(username: 'Anis'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 195, 225, 1),
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            CustomeAppBar(onMenuPressed: _openDrawer),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hi Anis",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Today is a good day\nto learn something new!",
                            style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Sorting(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CategoryList(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFE5D1EA),
            ),
            child: Text('Hello Peeps!'),
          ),         
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Add Course',
            style: TextStyle(fontSize: 17),
            ),
            onTap: () {
               Navigator.of(context).push(
                MaterialPageRoute(builder:(context) =>AddCourseScreen()),
              );
           //  Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Course Enrollment'),
            onTap: () {
              Navigator.of(context).push(
                 MaterialPageRoute(builder:(context) =>CourseEnrollmentScreen()),
              );
            },
          ),
         
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder:(context)=>WelcomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
  
  void logOut(BuildContext context) {}
}

 class AddCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
        backgroundColor: const Color.fromARGB(255, 210, 164, 218),
        
      ),
//  body: Center(
//         child: const Text('This is the Add Course Screen'),
//       ),
    );
 }
}

class CustomeAppBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;

  const CustomeAppBar({Key? key, this.onMenuPressed}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Remove the IconButton with the menu icon
      ],
    );
  }
}