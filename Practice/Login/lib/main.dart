import 'package:flutter/material.dart';
import 'package:login/screen/screen_login/LoginWidget.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginWidget(screenWidth: screenWidth, screenHeight: screenHeight)
        ),

    );
  }
}


