import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:teen_browser/features/controllers/pagination-controller/pagination_controller.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:alert/alert.dart';

class welcomeScreen_5 extends StatefulWidget {
  const welcomeScreen_5({Key? key}) : super(key: key);
  @override
  State<welcomeScreen_5> createState() => _welcomeScreen_5State();
}

class _welcomeScreen_5State extends State<welcomeScreen_5> {
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  late Timer _timer4;
  bool _youngTeamHeaders = false;
  bool _youngTeamImage = false;
  bool _youngTeamContent = false;
  bool _goButton = false;
  bool _clickGoButton = false;
  bool _loading = false;
  EzAnimation ezAnimation = EzAnimation(0.0, 200.0, const Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastLinearToSlowEaseIn);
  final PaginationController controller = Get.find();
  @override
  void initState() {
    super.initState();
    ezAnimation.start();
    _youngTeamImage = false;
    _timer1 = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _youngTeamImage = true;
      });
    });
    _timer2 = Timer(const Duration(milliseconds: 1600), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _youngTeamHeaders = true;
        _youngTeamContent = true;
      });
    });
    _timer3 = Timer(const Duration(milliseconds: 2500), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _goButton = true;
      });
    });
    _timer4 = Timer(const Duration(milliseconds: 5000), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _clickGoButton = true;
      });
    });
  }
  @override
  void dispose() {
    _timer1.cancel();
    _timer2.cancel();
    _timer3.cancel();
    _timer4.cancel();
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
              AnimatedOpacity(
                opacity: _youngTeamHeaders ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: const Text("Genç Squad!", style: TextStyle(fontSize: 32, color: Colors.white, fontFamily: "Montserrat"))
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              AnimatedOpacity(
                opacity: _youngTeamImage ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedBuilder(
                  animation: ezAnimation,
                  builder: (context, snapshot) {
                    return Center(
                      child: Image.asset("assets/SquadIcon.png", fit: BoxFit.cover, color: Colors.white, height: ezAnimation.value)
                    );
                  }
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              AnimatedOpacity(
                opacity: _youngTeamContent ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: const Text("Gençlerin halinden gençler anlar dedik, böyle bir işe giriştik, desteklerinizi ve geri bildirimlerinizi esirgemeyin!\n\nŞu anlık en iyisi değiliz ama en iyi olacağız 😎", textAlign: TextAlign.center, style: TextStyle(fontSize: 19, color: Colors.white, fontFamily: "Montserrat"))
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            child: AnimatedOpacity(
              opacity: _goButton ? 1 : 0,
              duration: const Duration(milliseconds: 1000),
              child: ElevatedButton(
                child: const Icon(Icons.arrow_forward_ios, size: 25),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  primary: Color.fromARGB(255, 46, 46, 46),
                ),
                onPressed: () {
                  if (_clickGoButton) {
                    if (_loading == false) {
                      setState(() {
                        _loading = true;
                      });
                      Timer(const Duration(milliseconds: 650), () {
                        setState(() {
                          ezAnimation.reverse();
                          _youngTeamImage = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 1200), () {
                        setState(() {
                          _youngTeamHeaders = false;
                          _youngTeamContent = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 1800), () {
                        setState(() {
                          _goButton = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 2200), () {
                        setState(() {
                          controller.pageNumber.value = 6;
                        });
                      });
                    }
                    if (_loading == true) {
                      print("not loading because loading is true.");
                    }
                  }
                  if (_clickGoButton == false) {
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}