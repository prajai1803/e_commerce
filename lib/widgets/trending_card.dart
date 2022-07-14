import 'package:e_commerce/screens/product_view.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatefulWidget {
  final name;
  final price;
  final image;
  final discription;
  TrendingCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    this.discription,
  }) : super(key: key);

  @override
  State<TrendingCard> createState() => _TrendingState();
}

class _TrendingState extends State<TrendingCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductView()));
      },
      child: Container(
        height: 320,
        width: 210,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      image:
                          DecorationImage(image: NetworkImage(widget.image))),
                ),
                Positioned(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.pink,
                      )),
                  right: 10,
                  top: 10,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.price.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inika",
                        ),
                      ),
                      Text(widget.name),
                    ],
                  ),
                  FloatingActionButton(
                    heroTag: "f",
                    onPressed: () {},
                    foregroundColor: Colors.transparent,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
