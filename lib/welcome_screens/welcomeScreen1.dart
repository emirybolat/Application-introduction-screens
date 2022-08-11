import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:teen_browser/features/controllers/pagination-controller/pagination_controller.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:alert/alert.dart';

class welcomeScreen_1 extends StatefulWidget {
  welcomeScreen_1({Key? key}) : super(key: key);
  @override
  State<welcomeScreen_1> createState() => _welcomeScreen_1State();
}

class _welcomeScreen_1State extends State<welcomeScreen_1> {
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  late Timer _timer4;
  late Timer _timer5;
  late Timer _timer6;
  late Timer _timer7;
  late Timer _timer8;
  late Timer _timer9;
  late Timer _timer10;
  int _helloText = 0;
  bool _helloTextState = false;
  bool _contentText = false;
  bool _letsGoButton = false;
  bool _clickGoButton = false;
  bool _skipButton = false;
  bool _clickSkipButton = false;
  bool _loading = false;
  bool _skipLoading = false;
  final PaginationController controller = Get.find();
  @override
  void initState() {
    super.initState();
    if (controller.isSkipped.value == false) {
      _timer1 = Timer(const Duration(milliseconds: 1000), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _helloText = 0;
        });
      });
      _timer2 = Timer(const Duration(milliseconds: 1050), () {
        if (!mounted) {
          return;
        }
        AssetsAudioPlayer.newPlayer().open(
          Audio("assets/audios/StopBroDontPassSound.mp3"),
          autoStart: true,
          showNotification: true,
        );
      });
      _timer3 = Timer(const Duration(milliseconds: 1200), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _helloTextState = true;
        });
      });
      _timer4 = Timer(const Duration(milliseconds: 3000), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _helloTextState = false;
        });
      });
      _timer5 = Timer(const Duration(milliseconds: 3900), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _helloText = 1;
        });
      });
      _timer6 = Timer(const Duration(milliseconds: 4200), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _helloTextState = true;
        });
      });
      _timer7 = Timer(const Duration(milliseconds: 5700), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _contentText = true;
        });
      });
      _timer8 = Timer(const Duration(milliseconds: 7000), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _letsGoButton = true;
        });
      });
      _timer9 = Timer(const Duration(milliseconds: 7300), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _skipButton = true;
        });
      });
      _timer10 = Timer(const Duration(milliseconds: 8500), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _clickGoButton = true;
          _clickSkipButton = true;
        });
      });
    }
  }
  @override
  void dispose() {
    _timer1.cancel();
    _timer2.cancel();
    _timer3.cancel();
    _timer4.cancel();
    _timer5.cancel();
    _timer6.cancel();
    _timer7.cancel();
    _timer8.cancel();
    _timer9.cancel();
    _timer10.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: _helloTextState ? 1 : 0,
              duration: const Duration(milliseconds: 250),
              child: Center(
                child: Text(_helloText == 0 ? "Dur kardeşim, geçme" : "Teen Browser'a hoş geldin.", style: TextStyle(fontFamily: "Montserrat", fontSize: 30, color: Colors.white),)
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            AnimatedOpacity(
              opacity: _contentText ? 1 : 0,
              duration: const Duration(milliseconds: 250),
              child: const Text("Teen Browser'ı anlatmama izin ver.", style: TextStyle(fontFamily: "Montserrat", fontSize: 20, color: Colors.white)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              children: [
                AnimatedOpacity(
                  opacity: _letsGoButton ? 1 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Olur", style: TextStyle(fontFamily: "Montserrat", fontSize: 19, color: Colors.blue, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (_clickGoButton == true) {
                        if (_loading == false) {
                          setState(() {
                            _loading = true;
                          });
                          Timer(const Duration(milliseconds: 500), () {
                            setState(() {
                              _skipButton = false;
                            });
                          });
                          Timer(const Duration(milliseconds: 700), () {
                            setState(() {
                              _letsGoButton = false;
                            });
                          });
                          Timer(const Duration(milliseconds: 1500), () {
                            setState(() {
                              _contentText = false;
                            });
                          });
                          Timer(const Duration(milliseconds: 1800), () {
                            setState(() {
                              _helloTextState = false;
                            });
                          });
                          Timer(const Duration(milliseconds: 2000), () {
                            setState(() {
                              controller.pageNumber.value = 2;
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
                AnimatedOpacity(
                  opacity: _skipButton ? 1 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Yok Eyv", style: TextStyle(fontFamily: "Montserrat", fontSize: 19, color: Colors.grey, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      var alertDialog = AlertDialog(
                        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                        title: const Text("Emin misin?", style: TextStyle(color: Colors.white, fontSize: 20)),
                        content: const Text("Olm o kadar tanıtım sayfası hazırladım, nolcak 2 dakika okusan? \n\nTanıtımı geçmek istediğine emin misin?", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                          actions: [
                            TextButton(
                              child: const Text("Eminim", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                              onPressed: () {
                                Navigator.pop(context);
                                if (_clickSkipButton == true) {
                                  if (_loading == false) {
                                    setState(() {
                                      _loading = true;
                                    });
                                    Timer(const Duration(milliseconds: 500), () {
                                      setState(() {
                                        _letsGoButton = false;
                                      });
                                    });
                                    Timer(const Duration(milliseconds: 700), () {
                                      setState(() {
                                        _skipButton = false;
                                      });
                                    });
                                    Timer(const Duration(milliseconds: 1500), () {
                                      setState(() {
                                        _contentText = false;
                                      });
                                    });
                                    Timer(const Duration(milliseconds: 1800), () {
                                      setState(() {
                                        _helloTextState = false;
                                      });
                                    });
                                    Timer(const Duration(milliseconds: 2000), () {
                                      setState(() {
                                        controller.pageNumber.value = 7;
                                      });
                                    });
                                  }
                                  if (_loading == true) {
                                    print("not loading because loading is true.");
                                  }
                                }
                              },
                            ),
                            TextButton(
                              child: Text("Vicdanım Sızladı", style: TextStyle(color: Colors.grey, fontSize: 18, fontFamily: "Montserrat")),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      showDialog(context: context, builder: (context) => alertDialog);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}