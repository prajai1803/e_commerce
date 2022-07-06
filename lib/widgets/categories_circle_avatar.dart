import 'package:flutter/material.dart';

class CategoriesCircleAvatar extends StatefulWidget {
  const CategoriesCircleAvatar({Key? key}) : super(key: key);

  @override
  State<CategoriesCircleAvatar> createState() => _CategoriesCircleAvatarState();
}

class _CategoriesCircleAvatarState extends State<CategoriesCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 80,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(maxRadius: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Category"),
            ),
          ],
        ),
      ),
    );
  }
}
