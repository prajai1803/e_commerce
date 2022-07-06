import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _gender;
  int id = 0;
  TextEditingController dateInput = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  String _date = "";
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
              title: Text("Registration Screen"),
              backgroundColor: AppColor.deep_orange,
              shadowColor: AppColor.deep_orange),
          body: Stack(
            children: [
              Container(
                  // padding: const EdgeInsets.only(left: 35, top: 130),
                  // child: const Text('Welcome\nBack',
                  //     style: TextStyle(color: Colors.red, fontSize: 33)),
                  ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _firstName,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _lastName,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          // height: MediaQuery.of(context).size.width / 3,
                          child: Center(
                              child: TextField(
                        controller: dateInput,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Date of Birth',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  1950), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);
                            //formatted date output using intl package =>  2021-03-16
                            // _date = formattedDate;
                            setState(() {
                              dateInput.text = formattedDate;
                              //set output date to TextField value.
                            });
                            _date = formattedDate;
                          } else {
                            pickedDate = DateTime.now();
                          }
                        },
                      ))),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    id = 1;
                                    _gender = "Male";
                                  });
                                },
                              ),
                              Text(
                                'Male',
                                style: new TextStyle(fontSize: 17.0),
                              ),
                              Radio(
                                value: 2,
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    id = 2;
                                    _gender = "Female";
                                  });
                                },
                              ),
                              Text(
                                'Female',
                                style: new TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                              Radio(
                                value: 3,
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    id = 3;
                                    _gender = "Trans";
                                  });
                                },
                              ),
                              Text(
                                'Trans',
                                style: new TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            print(_firstName.text);
                            print(_lastName.text);
                            print("$_gender");
                            print("date $_date");

                            addUser();
                          },
                          child: Text(
                            "Continue",
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.deep_orange)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    print("You call me");
    return users
        .add({
          'first_name': _firstName.text, // John Doe
          'last_name': _lastName.text, // Stokes and Sons
          'gender': _gender,
          "dob": dateInput.text, // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
