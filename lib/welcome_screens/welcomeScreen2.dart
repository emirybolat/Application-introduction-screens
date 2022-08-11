import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:teen_browser/features/controllers/pagination-controller/pagination_controller.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:alert/alert.dart';

class welcomeScreen_2 extends StatefulWidget {
  const welcomeScreen_2({Key? key}) : super(key: key);
  @override
  State<welcomeScreen_2> createState() => _welcomeScreen_2State();
}

class _welcomeScreen_2State extends State<welcomeScreen_2> {
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  late Timer _timer4;
  bool _secureAndHiddenHeaders = false;
  bool _secureAndHiddenImage = false;
  bool _secureAndHiddenContent = false;
  bool _goButton = false;
  bool _clickGoButton = false;
  bool _loading = false;
  EzAnimation ezAnimation = EzAnimation(0.0, 200.0, const Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastLinearToSlowEaseIn);
  final PaginationController controller = Get.find();
  @override
  void initState() {
    super.initState();
    ezAnimation.start();
    _secureAndHiddenImage = false;
    _timer1 = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _secureAndHiddenImage = true;
      });
    });
    _timer2 = Timer(const Duration(milliseconds: 1600), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _secureAndHiddenHeaders = true;
        _secureAndHiddenContent = true;
      });
    });
    _timer3 = Timer(const Duration(milliseconds: 3500), () {
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
                opacity: _secureAndHiddenHeaders ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: const Text("Gizli ve Güvenli", style: TextStyle(fontSize: 32, color: Colors.white, fontFamily: "Montserrat"))
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              AnimatedOpacity(
                opacity: _secureAndHiddenImage ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedBuilder(
                  animation: ezAnimation,
                  builder: (context, snapshot) {
                    return Center(
                      child: Image.asset("assets/SecureAndHiddenIcon.png", fit: BoxFit.cover, color: Colors.white, height: ezAnimation.value)
                    );
                  }
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              AnimatedOpacity(
                opacity: _secureAndHiddenContent ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: const Text("Gizliliğe ve güvenliğe siz ne kadar önem veriyorsanız, biz de o kadar önem veriyoruz 🛡️ ", textAlign: TextAlign.center, style: TextStyle(fontSize: 19, color: Colors.white, fontFamily: "Montserrat")),
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
                  primary: const Color.fromARGB(255, 46, 46, 46),
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
                          _secureAndHiddenImage = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 1200), () {
                        setState(() {
                          _secureAndHiddenHeaders = false;
                          _secureAndHiddenContent = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 1800), () {
                        setState(() {
                          _goButton = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 2200), () {
                        setState(() {
                          controller.pageNumber.value = 3;
                        });
                      });
                    }
                    if (_loading == true) {
                      print("not loading because loading is true.");
                    }
                  }
                }
              ),
            ),
          ),
        ]
      )
    );
  }
}