import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rant/bindings/home_bindings.dart';
import 'package:home_rant/core/constant/color_contant.dart';
import 'presentation/pages/primary_screen.dart';


void main() => runApp(
  MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PrimaryPage(),
      initialBinding: HomeBinding(),
    );
  }
}



