import 'package:flutter/material.dart';
import 'package:json_place_holder/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          title: const Text("Users",style: TextStyle(color: Colors.black),),
        ),
        body: const HomePage(),
      ),
    );
  }
}
