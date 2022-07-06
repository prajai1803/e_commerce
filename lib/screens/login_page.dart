import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    "Login Here",
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
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
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
                              _textBoxEmail(),
                              _textBoxPassword(),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Login",
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
}

_textBoxEmail() {
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
    child: TextFormField(
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

_textBoxPassword() {
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
    child: TextFormField(
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
