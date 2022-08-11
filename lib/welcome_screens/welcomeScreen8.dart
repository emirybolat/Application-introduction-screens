import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:teen_browser/features/controllers/pagination-controller/pagination_controller.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teen_browser/functions/secure_storage.dart';

class welcomeScreen_8 extends StatefulWidget {
  const welcomeScreen_8({Key? key}) : super(key: key);
  @override
  State<welcomeScreen_8> createState() => _welcomeScreen_8State();
}

class _welcomeScreen_8State extends State<welcomeScreen_8> {
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  bool _teenLogo = false;
  EzAnimation ezAnimation = EzAnimation(0.0, 200.0, const Duration(milliseconds: 1000), curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.easeInBack);
  final PaginationController controller = Get.find();
  @override
  void initState() {
    super.initState();
    ezAnimation.start();
    _teenLogo = false;
    _timer1 = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _teenLogo = true;
      });
    });
    _timer2 = Timer(const Duration(milliseconds: 2700), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _teenLogo = false;
      });
    });
    _timer3 = Timer(const Duration(milliseconds: 2700), () async {
      if (!mounted) {
        return;
      }
      await UserSecureStorage.setField("isSkipped", "true");
      controller.isSkipped.value = true;
    });
  }
  @override
  void dispose() {
    _timer1.cancel();
    _timer2.cancel();
    _timer3.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedOpacity(
                  opacity: _teenLogo ? 1 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: Center(
                    child: Image.asset("assets/Logo.png", fit: BoxFit.contain, height: 200, width: 200),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}