import 'package:flutter/material.dart';
import 'package:profileapp/pages/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Activity 4',
    theme: ThemeData(
      primarySwatch: Colors.brown,
    ),
    home: const HomePage(),
  ));
}
