import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_browser/pages/LoginAndRegister/LoginPage.dart';
import 'package:teen_browser/pages/LoginAndRegister/RegisterPage.dart';
import 'package:email_validator/email_validator.dart';
TextEditingController _emailController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _surnameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
bool _emailValid = EmailValidator.validate(_emailController.text);
FirebaseAuth _auth = FirebaseAuth.instance;
class RegisterPage extends StatelessWidget {
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Center(
                          child: Image.asset("assets/Logo.png",
                              height: MediaQuery.of(context).size.height * 0.1),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Ad:",
                              style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Montserrat"),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Montserrat"),
                            hintText: "Ad",
                              fillColor: Color.fromARGB(179, 55, 55, 55)),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Soyad:",
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Montserrat"),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Montserrat"),
                              hintText: "Soyad",
                              fillColor: Color.fromARGB(179, 55, 55, 55)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("E-Posta:",
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Montserrat"),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.mail),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Montserrat"
                            ),
                            hintText: "E-Posta",
                              fillColor: const Color.fromARGB(179, 55, 55, 55),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Parola:",
                              style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Montserrat"),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                prefixIconColor:
                                    const Color.fromARGB(255, 162, 162, 162),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[600],
                                    fontFamily: "Montserrat"),
                                prefixStyle: TextStyle(color: Colors.grey[600]),
                                hintText: "Parola",
                                fillColor: const Color.fromARGB(179, 55, 55, 55)),
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16), // <-- Radius
                                  ),
                                ),
                                child: const Text("Hesap Oluştur",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Montserrat"),
                                ),
                                onPressed: () async {
                                  if (_emailController.text.isEmpty) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: const Text("E-posta adresini girmelisin.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                  } else if (_nameController.text.isEmpty) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: const Text("Adını girmelisin.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                  } else if (_surnameController.text.isEmpty) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: const Text("Soyadını girmelisin.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                  } else if (_passwordController.text.isEmpty) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: const Text("Hesap şifresi girmelisin.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                      content: const Text("Geçersiz e-posta adresi.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                  } else if (_passwordController.text.length < 6) {
                                    var alertDialog = AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                      content: const Text("Parola en az 6 karakter olmalıdır.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                      await _auth.createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                      var alertDialog = AlertDialog(
                                        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                        content: const Text("Hesabınız başarıyla oluşturuldu! Şimdi giriş yapabilirsiniz.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                      Get.to(LoginPage());
                                    } on FirebaseException catch(e) {
                                      if (e.code == "email-already-in-use") {
                                        var alertDialog = AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                          content: const Text("Girdiğiniz e-posta başka bir kullanıcıya ait. Lütfen farklı bir e-posta adresi girin.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                      } else if (e.code == "error-weak-password") {
                                        var alertDialog = AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 25, 25, 25),
                                          content: const Text("Parola çok basit. Lütfen daha güçlü bir parola belirleyin.", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                                          content: Text("Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyin. \n\nHata kodu: ${e.code}", style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Montserrat")),
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
                        child: const Text("Giriş Yap", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Montserrat")),
                        onPressed: () {
                          Get.to(LoginPage());
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