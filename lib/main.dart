import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teen_browser/pages/App/HomePage.dart';
import 'package:teen_browser/pages/LoginAndRegister/LoginPage.dart';
import 'package:teen_browser/welcome_screens/welcomeMain.dart';
import 'package:get/get.dart';
import 'features/controllers/pagination-controller/pagination_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

var skipStatus;
var currentUser = FirebaseAuth.instance.currentUser;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(mainApp());
}

class mainApp extends StatefulWidget {
  mainApp({Key? key}) : super(key: key);
  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat Regular'),
      home: passedTheWelcomeScreen(),
    );
  }
}

class passedTheWelcomeScreen extends StatefulWidget {
  passedTheWelcomeScreen({Key? key}) : super(key: key);
  @override
  State<passedTheWelcomeScreen> createState() => _passedTheWelcomeScreenState();
}

class _passedTheWelcomeScreenState extends State<passedTheWelcomeScreen> {
  final PaginationController _paginationController = Get.put(PaginationController());
  @override
  Widget build(BuildContext context) {
    return GetX<PaginationController>(
      init: _paginationController,
      initState: (initController) {
        initController.controller!.CheckSkipStatus();
      },
      builder: (controller) {
        if (controller.isSkipped.value == null) {
          return const CircularProgressIndicator();
        } else if (controller.isSkipped.value == true) {
          if (currentUser == null) {
            return LoginPage();
          } else {
            return const HomePage();
          }
        } else {
          return const welcomeMain();
        }
      },
    );
  }
}