import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajra_app/app/ui/deceased_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DeceasedPersonScreen()
        // const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
