import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_browser/pages/LoginAndRegister/LoginPage.dart';
import 'package:teen_browser/pages/LoginAndRegister/RegisterPage.dart';
import 'package:email_validator/email_validator.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
bool _emailValid = EmailValidator.validate(_emailController.text);
FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: SizedBox(
              height: constraints.maxHeight,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Center(
                          child: Image.asset("assets/Logo.png", height: MediaQuery.of(context).size.height * 0.1),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const Center(
                          child: Text("Giriş Yap", style: TextStyle(fontSize: 30, color: Colors.white)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("E-Posta:", style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat"),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[600], fontFamily: "Montserrat"),
                              hintText: "E-Posta",
                              fillColor: Color.fromARGB(179, 55, 55, 55)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Parola:", style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat"),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              prefixIconColor: Color.fromARGB(255, 162, 162, 162),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[600], fontFamily: "Montserrat"),
                              prefixStyle: TextStyle(color: Colors.grey[600]),
                              hintText: "Parola",
                              fillColor: Color.fromARGB(179, 55, 55, 55),
                            ),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 47, 47, 47),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16), // <-- Radius
                                  ),
                                ),
                                child: Text("Giriş Yap", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Montserrat")),
                                onPressed: () {
                                  if (_emailController.text.isEmpty) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: Text("E-posta adresi boş bırakılamaz.", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                      actions: [
                                        TextButton(
                                          child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                    showDialog(context: context, builder: (context) => alertDialog);
                                  }
                                  else if (_passwordController.text.isEmpty) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: Text("Parola alanı boş bırakılamaz.", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                      actions: [
                                        TextButton(
                                          child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                    showDialog(context: context, builder: (context) => alertDialog);
                                  } else if (_emailValid == false) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: Text("E-posta adresi geçersiz. Lütfen geçerli bir e-posta adresi girin.", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                      actions: [
                                        TextButton(
                                          child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                    showDialog(context: context, builder: (context) => alertDialog);
                                  } else {
                                    try {
                                      _auth.signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    } on FirebaseAuthException catch(e) {
                                      if (e.code == "user-not-found") {
                                        var alertDialog = AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                          content: Text("Girdiğiniz e-posta adresine kayıtlı kullanıcı bulunamadı.", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                          actions: [
                                            TextButton(
                                              child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      showDialog(context: context, builder: (context) => alertDialog);
                                      } else if (e.code == "wrong-password") {
                                        var alertDialog = AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                          content: Text("Parola yanlış.", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                          actions: [
                                            TextButton(
                                              child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                        showDialog(context: context, builder: (context) => alertDialog);
                                      } else if (e.code == "user-disabled") {
                                        var alertDialog = AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                          content: Text("Hesabınız devredışı bırakılmış. Sebebini öğrenmek için geliştiriciyle iletişime geçebilirsiniz.", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                          actions: [
                                            TextButton(
                                              child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                        showDialog(context: context, builder: (context) => alertDialog);
                                      } else if (e.code == "too-many-requests") {
                                        var alertDialog = AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                          content: Text("Çok fazla giriş denemesi yaptınız. Lütfen daha sonra tekrar deneyin.", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                          actions: [
                                            TextButton(
                                              child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                        showDialog(context: context, builder: (context) => alertDialog);
                                      } else {
                                        var alertDialog = AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                          content: Text("Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyin. \n\nHata bilgileri: ${e.code} + ${e.message}", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
                                          actions: [
                                            TextButton(
                                              child: const Text("Tamam", style: TextStyle(color: Colors.blue, fontSize: 18, fontFamily: "Montserrat")),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                        showDialog(context: context, builder: (context) => alertDialog);
                                      }
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextButton(
                        child: const Text("Kayıt Ol", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Montserrat")),
                        onPressed: () {
                          Get.to(RegisterPage());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}