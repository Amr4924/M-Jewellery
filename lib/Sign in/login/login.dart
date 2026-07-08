import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/Sign%20in/login/widgets/button_login.dart';
import 'package:loding_screen/Sign%20in/login/widgets/create_account.dart';
import 'package:loding_screen/Sign%20in/login/widgets/forget_password.dart';
import 'package:loding_screen/mainScreen.dart';
import "package:easy_localization/easy_localization.dart";
import 'package:loding_screen/widgets/change_lang_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hiddenPassword = true;
  bool checkData = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void togglehiddenPassword() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  void _checkData() async {
    setState(() {
      checkData = false;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      checkData = true;
    });
    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A2F1D),
      body: Column(
        children: [
          SizedBox(height: 70),
          Align(
            alignment: Alignment.topRight,
            child: changeLanguageButton(context: context),
          ),
          Center(
            child: Icon(
              Icons.diamond_outlined,
              size: 120,
              color: Color(0xFFC5A059),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        tr('welcome-login'),
                        style: TextStyle(
                          color: Color.fromARGB(255, 14, 71, 44),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlayfairDisplay',
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    // ------- Field Email ---------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        controller: emailController,
                        validator: (value) {
                          String email = value!.trim().toLowerCase();
                          if (email.isEmpty) {
                            return tr('empty');
                          } else if (!email.contains('@')) {
                            return tr('invalidAt');
                          } else if (email.indexOf("@") == 0) {
                            return tr('emptyUsername');
                          } else if (!email.endsWith(".com")) {
                            return tr('mustEndCom');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color(0xFFC5A059),
                          ),
                          hintText: "email@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // ------- Field Paasord ---------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: hiddenPassword,
                        validator: (value) {
                          String password = value!;
                          if (password.isEmpty) {
                            return tr('empty');
                          } else if (password.length < 8) {
                            return tr('length-password');
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.lock,
                            color: Color(0xFFC5A059),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              togglehiddenPassword();
                            },
                            icon: hiddenPassword
                                ? Icon(
                                    CupertinoIcons.eye,
                                    color: Color(0xFFC5A059),
                                  )
                                : Icon(
                                    CupertinoIcons.eye_slash,
                                    color: Color(0xFFC5A059),
                                  ),
                          ),
                          hintText: "********",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),

                    // ------- ForgetPassword Button ---------
                    BuildForgetPassword(),
                    // ------- Button login ---------
                    BuildButtonLogin(
                      formKey: _formKey,
                      check: () => _checkData(),
                      checkData: checkData,
                      emailsField: emailController,
                      passwordsField: passwordController,
                    ),

                    // ------- Create Account Button ---------
                    Center(child: BuildCreateAccount()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
