import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:teen_browser/features/controllers/pagination-controller/pagination_controller.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class welcomeScreen_7 extends StatefulWidget {
  const welcomeScreen_7({Key? key}) : super(key: key);
  @override
  State<welcomeScreen_7> createState() => _welcomeScreen_7State();
}

class _welcomeScreen_7State extends State<welcomeScreen_7> {
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  bool _welcomeHeaders = false;
  EzAnimation ezAnimation = EzAnimation(0.0, 200.0, const Duration(milliseconds: 1000), curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastLinearToSlowEaseIn);
  final PaginationController controller = Get.find();
  @override
  void initState() {
    super.initState();
    ezAnimation.start();
    _welcomeHeaders = false;
    _timer1 = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _welcomeHeaders = true;
      });
    });
    _timer2 = Timer(const Duration(milliseconds: 3500), () {
      setState(() {
        _welcomeHeaders = false;
      });
    });
    _timer3 = Timer(const Duration(milliseconds: 5000), () {
      setState(() {
        controller.pageNumber.value = 8;
      });
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedOpacity(
                  opacity: _welcomeHeaders ? 1 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: const Text("O halde Teen Browser'a hoş geldin :)", style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: "Montserrat"))
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
