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

class welcomeScreen_3 extends StatefulWidget {
  const welcomeScreen_3({Key? key}) : super(key: key);
  @override
  State<welcomeScreen_3> createState() => _welcomeScreen_3State();
}

class _welcomeScreen_3State extends State<welcomeScreen_3> {
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  late Timer _timer4;
  bool _usefulInterfaceHeaders = false;
  bool _usefulInterfaceImage = false;
  bool _usefulInterfaceContent = false;
  bool _goButton = false;
  bool _clickGoButton = false;
  bool _loading = false;
  EzAnimation ezAnimation = EzAnimation(0.0, 200.0, const Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastLinearToSlowEaseIn);
  final PaginationController controller = Get.find();
  @override
  void initState() {
    super.initState();
    ezAnimation.start();
    _usefulInterfaceImage = false;
    _timer1 = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _usefulInterfaceImage = true;
      });
    });
    _timer2 = Timer(const Duration(milliseconds: 1600), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _usefulInterfaceHeaders = true;
        _usefulInterfaceContent = true;
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
    _timer4 = Timer(const Duration(milliseconds: 4000), () {
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
                opacity: _usefulInterfaceHeaders ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: const Text("Basit, Özelleştirilebilir Arayüz", style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: "Montserrat"))
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              AnimatedOpacity(
                opacity: _usefulInterfaceImage ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedBuilder(
                  animation: ezAnimation,
                  builder: (context, snapshot) {
                    return Center(
                      child: Image.asset("assets/ClearInterfaceIcon.png", fit: BoxFit.cover, color: Colors.white, height: ezAnimation.value)
                    );
                  }
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              AnimatedOpacity(
                opacity: _usefulInterfaceContent ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Zoro ",
                        style: const TextStyle(fontSize: 19, color: Colors.white, fontFamily: "Montserrat"),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (_loading == false) {
                            Timer(const Duration(milliseconds: 100), () {
                              setState(() {
                                AssetsAudioPlayer.newPlayer().open(
                                  Audio("assets/audios/ZoroEasterEggSound.mp3"),
                                  autoStart: true,
                                  showNotification: true,
                                );
                                ezAnimation = EzAnimation(200.0, 230.0, const Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastLinearToSlowEaseIn);
                                ezAnimation.start();
                              });
                            });
                            Timer(const Duration(milliseconds: 1500), () {
                              setState(() {
                                ezAnimation = EzAnimation(230.0, 200.0, const Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastLinearToSlowEaseIn);
                                ezAnimation.start();
                              });
                            });
                          }
                          else if (_loading = true) {
                            print("not loading because loading is true.");
                          }
                        },
                      ),
                      const TextSpan(
                        text: "gibi kaybolmaman için rehberin olacağız! Basit ve özelleştirilebilir bir arayüz ile birlikte özgürlüğünüzün tadını çıkarın! ⚙️ ", style: TextStyle(
                        fontSize: 19,
                        color: Colors.white, fontFamily: "Montserrat"),
                      ),
                    ]),
                  )
                ),
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
                  if (_clickGoButton == true) {
                    if (_loading == false) {
                      setState(() {
                        _loading = true;
                      });
                      Timer(const Duration(milliseconds: 650), () {
                        setState(() {
                          ezAnimation.reverse();
                          _usefulInterfaceImage = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 1200), () {
                        setState(() {
                          _usefulInterfaceHeaders = false;
                          _usefulInterfaceContent = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 1800), () {
                        setState(() {
                          _goButton = false;
                        });
                      });
                      Timer(const Duration(milliseconds: 2200), () {
                        setState(() {
                          controller.pageNumber.value = 4;
                        });
                      });
                    }
                    if (_loading == true) {
                      print("not loading because loading is true.");
                    }
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
