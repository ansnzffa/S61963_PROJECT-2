import 'package:flutter/material.dart';

class Sorting extends StatelessWidget {
  final VoidCallback? onSearchPressed;
  final ValueChanged<String>? onSearchTextChanged;

  const Sorting({Key? key, this.onSearchPressed, this.onSearchTextChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // space between widgets
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
        // Add the TextField for searching
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              onChanged: onSearchTextChanged,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: "Search courses...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                fillColor: Colors.grey.shade800,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 10),
        //   child: Container(height: 20, child: Image.asset("assets/icon/sort.png")),
        // ),
      ],
    );
  }
}