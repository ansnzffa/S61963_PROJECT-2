import 'package:flutter/material.dart';

import 'package:e_learning_app/constant/constants.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
            ))
      ],
    );
  }
}