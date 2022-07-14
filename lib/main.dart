import 'package:e_commerce/screens/app_base.dart';
import 'package:e_commerce/screens/display_data.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/login_page.dart';
import 'package:e_commerce/screens/product_view.dart';
import 'package:e_commerce/screens/register_page.dart';
import 'package:e_commerce/screens/signup_page.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:e_commerce/widgets/categories_circle_avatar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
              home: APIDataShow(),
              debugShowCheckedModeBanner: false,
            ));
  }
}
