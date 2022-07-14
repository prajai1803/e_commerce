import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final Stream<QuerySnapshot> _userstream =
      FirebaseFirestore.instance.collection('Product').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _userstream,
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              print(data["name"]);
              if (snapshot.hasData) {
                return ListTile(
                  leading: Image(
                    image: NetworkImage(data["image"]),
                  ),
                  title: Text(data['name']),
                  subtitle: Text(data['price']),
                );
              } else {
                return Text("Waiting");
              }
            }).toList(),
          );
        });
  }
}
