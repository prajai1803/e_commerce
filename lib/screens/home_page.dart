import 'package:e_commerce/widgets/categories_circle_avatar.dart';
import 'package:e_commerce/widgets/trending_card.dart';
import 'package:flutter/material.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Collections",
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    "Collections",
                    style: TextStyle(fontSize: 30, fontFamily: "Robota"),
                  ),
                ),
                _popupmenu()
              ],
            ),
            SizedBox(
              height: 110,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => CategoriesCircleAvatar()),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  child: Text(
                    "New In",
                    style: TextStyle(fontSize: 26, fontFamily: "Robota"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => TrendingCard()),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 10, right: 10),
              child: _searchBar(),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton _popupmenu() {
    return PopupMenuButton<Menu>(
        icon: Icon(
          Icons.more_horiz_outlined,
          color: Colors.amber,
        ),
        itemBuilder: (BuildContext) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('Item 3'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('Item 4'),
              ),
            ]);
  }

  _searchBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 22,
                  child: Icon(Icons.search_outlined),
                ),
                enabledBorder: InputBorder.none,
                hintText: "Find Something",
                hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                suffixIcon: Icon(Icons.filter_2_outlined)),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ),
    );
  }
}
