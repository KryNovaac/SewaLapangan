import 'package:flutter/material.dart';
import 'package:sewa_lapangan/landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sewa Lapangan',
      debugShowCheckedModeBanner: false,
      home: LandingPage()
    );
  }
}