import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_browser/features/controllers/pagination-controller/pagination_controller.dart';
import 'package:teen_browser/main.dart';
import 'package:teen_browser/pages/App/HomePage.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen1.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen2.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen3.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen4.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen5.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen6.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen7.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen8.dart';
import 'package:teen_browser/welcome_screens/welcomeScreen8.dart';
import 'package:path_provider/path_provider.dart';

class welcomeMain extends StatefulWidget {
  const welcomeMain({Key? key}) : super(key: key);
  @override
  State<welcomeMain> createState() => _welcomeMainState();
}

class _welcomeMainState extends State<welcomeMain> {
  @override
  void initState() {
    super.initState();
  }
  final PaginationController paginationController = Get.put(PaginationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GetX<PaginationController>(
                init: PaginationController(),
                initState: (_) {},
                builder: (controller) {
                  if (controller.pageNumber.value == 1) {
                    return welcomeScreen_1();
                  } else if (controller.pageNumber.value == 2) {
                    return const welcomeScreen_2();
                  } else if (controller.pageNumber.value == 3) {
                    return const welcomeScreen_3();
                  } else if (controller.pageNumber.value == 4) {
                    return const welcomeScreen_4();
                  } else if (controller.pageNumber.value == 5) {
                    return const welcomeScreen_5();
                  } else if (controller.pageNumber.value == 6) {
                    return const welcomeScreen_6();
                  } else if (controller.pageNumber.value == 7) {
                    return const welcomeScreen_7();
                  } else if (controller.pageNumber.value == 8) {
                    return const welcomeScreen_8();
                  }
                  return HomePage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}