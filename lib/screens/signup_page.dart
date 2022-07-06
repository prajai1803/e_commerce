import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/screens/register_page.dart';
import 'package:e_commerce/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(.3, 0),
            end: Alignment.topCenter,
            colors: <Color>[
              AppColor.deep_orange,
              Color(0xFFFF8F8F),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35, left: 55),
                  child: Text(
                    "Sign Up Here",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inika",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 55),
                  child: Row(
                    children: [
                      Text(
                        "Already have a account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inria Serif",
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFFCD0000),
                            fontFamily: "Inria Serif",
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Center(
                    child: Card(
                      elevation: 10,
                      surfaceTintColor: AppColor.deep_orange,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1, 2),
                            end: Alignment.topCenter,
                            colors: <Color>[
                              AppColor.deep_orange,
                              Color(0xFFBB2222),
                            ],
                          ),
                        ),
                        height: 450.h,
                        width: 300.w,
                        child: Center(
                          child: Column(
                            children: [
                              _textBoxEmail(_email),
                              _textBoxPassword(_password),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(msg: "yes");
                                    singup();
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontFamily: "Inika",
                                        fontStyle: FontStyle.italic),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 10,
                                      primary:
                                          Color.fromARGB(255, 175, 49, 49)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void singup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

_textBoxEmail(var email) {
  return Container(
    height: 50,
    width: 500,
    margin: const EdgeInsets.only(left: 20, right: 20, top: 80),
    padding: const EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      border: Border.all(width: 2, color: AppColor.deep_orange),
      color: Colors.white,
    ),
    child: TextField(
      controller: email,
      cursorColor: AppColor.deep_orange,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: "Email",
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    ),
  );
}

_textBoxPassword(var password) {
  return Container(
    height: 50,
    width: 500,
    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
    padding: const EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      border: Border.all(width: 2, color: AppColor.deep_orange),
      color: Colors.white,
    ),
    child: TextField(
      controller: password,
      cursorColor: AppColor.deep_orange,
      decoration: const InputDecoration(
        icon: Icon(Icons.vpn_key),
        hintText: "Password",
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    ),
  );
}
