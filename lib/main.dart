import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine/const/app_color.dart';
import 'package:medicine/screens/add_medicine.dart';
import 'package:medicine/screens/home_screen.dart';
import 'package:medicine/screens/login_screen.dart';
import 'package:medicine/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        fontFamily: GoogleFonts.outfit().fontFamily,
        useMaterial3: true,
      ),
      home: AddMedicine(),
    );
  }
}

