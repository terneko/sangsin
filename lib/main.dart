import 'package:flutter/material.dart';
import 'package:sangsin/screens/home_screen.dart';
import 'package:sangsin/screens/personal_photo.dart';

import 'imagePicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const HomeScreen(),
        '/photo': (context) => const Photo(), // Fixed the extra '/'
        '/imagePicker': (context) =>
            const ImagePickerPage(), // Fixed the extra '/'
      },
    );
  }
}
