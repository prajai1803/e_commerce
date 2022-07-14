import 'package:e_commerce/screens/mens.dart';
import 'package:e_commerce/screens/women.dart';
import 'package:flutter/material.dart';

class CategoriesCircleAvatar extends StatefulWidget {
  final name, image;
  var targetPage;
  CategoriesCircleAvatar({Key? key, this.name, this.image, this.targetPage})
      : super(key: key);

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
            InkWell(
              onTap: () {
                if (widget.name == "Mens") {
                  widget.targetPage = MensPage();
                }
                if (widget.name == "Women") {
                  widget.targetPage = WomenPage();
                }

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => widget.targetPage));
              },
              child: CircleAvatar(
                  maxRadius: 30, backgroundImage: NetworkImage(widget.image)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.name),
            ),
          ],
        ),
      ),
    );
  }
}
