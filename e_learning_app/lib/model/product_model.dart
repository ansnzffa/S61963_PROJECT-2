
import 'package:e_learning_app/model/product_list.dart'; // Import the product list screen file

import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id, courses;
  final Color color;

  Product({
    required this.image,
    required this.title,
    required this.courses,
    required this.color,
    required this.id,
  });
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

  void _navigateToProductList(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Other widgets...

                  // Features
                  for (Product product in products)
                    InkWell(
                      onTap: () => _navigateToProductList(product),
                      child: FeatureCard(product: product),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final Product product;

  const FeatureCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: product.color,
          backgroundImage: AssetImage(product.image),
        ),
        title: Text(product.title),
        subtitle: Text('${product.courses} Courses'),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final Product product;

  const ProductListScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the UI for the ProductListScreen here
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Text('Product List for ${product.title}'),
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
              color: Color.fromRGBO(210, 166, 218, 1),
            ),
            child: Text('Hello Peeps!'),
          ),
          // Add more items as needed
        ],
      ),
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
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onMenuPressed,
        ),
      ],
    );
  }
}

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

List<Product> products = [
  Product(
    id: 1,
    title: "Graphic Design",
    image: "assets/images/graphics.png",
    color: Color(0xFF71b8ff),
    courses: 2,
  ),
  Product(
    id: 2,
    title: "Programming",
    image: "assets/images/programming.png",
    color: const Color.fromARGB(255, 158, 204, 241),
    courses: 3,
  ),
  Product(
    id: 3,
    title: "Finance",
    image: "assets/images/finance.png",
    color: const Color.fromARGB(255, 224, 165, 235),
    courses: 1,
  ),
  Product(
    id: 4,
    title: "UI/Ux design",
    image: "assets/images/ux.png",
    color: Color(0xFF9ba0fc),
    courses: 2,
  ),
];
