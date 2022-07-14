import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WomenPage extends StatefulWidget {
  const WomenPage({Key? key}) : super(key: key);

  @override
  State<WomenPage> createState() => _WomenPageState();
}

class _WomenPageState extends State<WomenPage> {
  final Stream<QuerySnapshot> _women = FirebaseFirestore.instance
      .collection('/Category/U37qS2HpNBC0TDyFe7u5/Women')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 500,
          width: 500,
          child: StreamBuilder<QuerySnapshot>(
              stream: _women,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Wrogn");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading...");
                }
                return ListView(
                  scrollDirection: Axis.vertical,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['name']),
                      leading: Image(
                        image: NetworkImage(data['image']),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
