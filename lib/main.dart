import 'package:flutter/material.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/src/modules/home_screen/views/my_task_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.appColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyTask(),
    );
  }
}
