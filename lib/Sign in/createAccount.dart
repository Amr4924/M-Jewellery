// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loding_screen/widgets/change_lang_button.dart';
import 'Accounts.dart';

class CreateAccoundScreen extends StatefulWidget {
  const CreateAccoundScreen({super.key});

  @override
  State<CreateAccoundScreen> createState() => _CreateAccoundScreenState();
}

class _CreateAccoundScreenState extends State<CreateAccoundScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  bool lodData = true;

  void toggleHiddenPaswword() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  void _lodData() async {
    setState(() {
      lodData = false;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      lodData = true;
    });
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A2F1D),
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: changeLanguageButton(context: context),
            ),
          ),
          SizedBox(
            height: 120,
            child: Center(
              child: Text(
                tr('sign-up'),
                style: const TextStyle(
                  color: Color(0xFFC5A059),
                  fontSize: 34,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
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
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Icon(Icons.arrow_back, color: Color(0xFFC5A059)),
                      title: Text(
                        tr("back_login"),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFFC5A059),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    // ------- Name Field -------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          String name = value!;
                          final nameRagExp = RegExp(
                            r'^[a-zA-z\s\u0600-\u06FF]+$',
                          );
                          if (name.isEmpty) {
                            return tr('empty');
                          } else if (!nameRagExp.hasMatch(name)) {
                            return tr('invalidNameChars');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          prefixIconColor: Color(0xFFC5A059),
                          labelText: tr('full-name'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // ------- Email Field -------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          String email = value!.trim().toLowerCase();
                          if (email.isEmpty) {
                            return tr('empty');
                          } else if (!email.contains('@')) {
                            return tr('invalidAt');
                          } else if (!email.endsWith('.com')) {
                            return tr('mustEndCom');
                          } else if (email.indexOf('@') == 0) {
                            return tr('emptyUsername');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          prefixIconColor: Color(0xFFC5A059),
                          labelText: tr('email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // ------- Phone Field -------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return tr('empty');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          prefixIconColor: Color(0xFFC5A059),
                          labelText: tr('phone'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // ------- Password Field -------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: hiddenPassword,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return tr('empty');
                          } else if (value != null && value.length < 8) {
                            return tr('length-password');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.lock),
                          prefixIconColor: Color(0xFFC5A059),
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleHiddenPaswword();
                            },
                            icon: hiddenPassword
                                ? Icon(CupertinoIcons.eye)
                                : Icon(CupertinoIcons.eye_slash),
                          ),
                          suffixIconColor: Color(0xFFC5A059),
                          labelText: tr('password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    _buildButtomSignUp(
                      context: context,
                      form: _formKey,
                      name: nameController,
                      email: emailController,
                      password: passwordController,
                      phone: passwordController,
                      lodData: lodData,
                      lod: _lodData,
                    ),
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

Widget _buildButtomSignUp({
  required BuildContext context,
  required GlobalKey<FormState> form,
  required TextEditingController name,
  required TextEditingController email,
  required TextEditingController phone,
  required TextEditingController password,
  required VoidCallback lod,
  required bool lodData,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A2F1D)),
      onPressed: !lodData
          ? null
          : () {
              if (form.currentState!.validate()) {
                AuthManager.registerUsers.add(
                  UserModel(
                    name: name.text,
                    email: email.text,
                    password: password.text,
                    phone: phone.text,
                  ),
                );
                lod();
              }
            },
      child: Center(
        child: lodData
            ? Text(
                tr('sign-up'),
                style: TextStyle(
                  color: Color(0xFFC5A059),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay',
                ),
              )
            : CircularProgressIndicator(color: Color(0xFFC5A059)),
      ),
    ),
  );
}
