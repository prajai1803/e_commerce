import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final Stream<QuerySnapshot> _userstream =
      FirebaseFirestore.instance.collection('Product').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("pj"),
    );
  }
}
