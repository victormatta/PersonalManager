import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:personal_manager/model/user.dart';
// import 'package:personal_manager/controller/user_controller.dart';

import './view/Page1.dart';
import './view/Page2.dart';

void main() => runApp(const PmgApp());

class PmgApp extends StatelessWidget {
  const PmgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Personal Manager",
      debugShowCheckedModeBanner: false,
      initialRoute: 'page1',
      getPages: [
        GetPage(name: "/page1", page: () =>  const Page1()),
        GetPage(name: "/page2", page: () => const Page2())
      ],
    );
  }
}