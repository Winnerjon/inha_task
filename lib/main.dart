import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/di_service.dart';
import 'views/phone/phone_screen.dart';

void main() async {

  /// #for controller
  await DIService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inha Task',
      home: PhoneScreen(),
    );
  }
}
