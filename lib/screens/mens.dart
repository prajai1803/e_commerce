import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MensPage extends StatefulWidget {
  const MensPage({Key? key}) : super(key: key);

  @override
  State<MensPage> createState() => _MensPageState();
}

class _MensPageState extends State<MensPage> {
  final Stream<QuerySnapshot> _mens = FirebaseFirestore.instance
      .collection('/Category/D1hAsUSDNbROXtFPCy5B/Mens')
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
              stream: _mens,
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
                        ));
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
