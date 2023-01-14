import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_mobile/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: 'Nunito'),
      // locale: Get.deviceLocale,
      // App Routes
      getPages: Routes.getPages,
      // initialBinding: AppBindings(),
      initialRoute:'/homeScreen',
    );
  }
}
