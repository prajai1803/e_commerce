import 'package:e_commerce/screens/home_page.dart';
import 'package:flutter/material.dart';

String dummytxt =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Products",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Robota",
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 500,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 140,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/73019477?v=4'),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 22,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Indo-Western",
                  style: TextStyle(
                      fontFamily: "Robota",
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text(
                  "Rs 1800",
                  style: TextStyle(
                      fontFamily: "Inika",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customRadio("S", 0),
                customRadio("M", 1),
                customRadio("L", 2),
                customRadio("XL", 3),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$dummytxt"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {}, child: Text("Add To cart")),
          )
        ],
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectIndex = index;
        });
        print(selectIndex);
      },
      style: ElevatedButton.styleFrom(maximumSize: Size(180, 180)),
      child: Text(
        '$txt',
        style: TextStyle(
            fontSize: 40,
            color: selectIndex == index ? Colors.white : Colors.black),
      ),
    );
  }
}
