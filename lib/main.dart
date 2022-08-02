import 'package:flutter/material.dart';
import 'package:ylo/ui/screens/bag.dart';
import 'package:ylo/ui/screens/home_page.dart';
import 'package:ylo/ui/screens/main_page.dart';
import 'package:ylo/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
