// ignore_for_file: file_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/Sign%20in/login.dart';
import "package:easy_localization/easy_localization.dart";

void changeLang(BuildContext context) {
  if (context.locale == Locale('en', 'US')) {
    context.setLocale(Locale('ar', 'EG'));
  } else {
    context.setLocale(Locale('en', 'US'));
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool lodingData = true;

  @override
  void initState() {
    super.initState();
    _lodingData();
  }

  void _lodingData() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      lodingData = !lodingData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: lodingData ? _buildLodingScreen() : _buildPageView(context),
      ),
    );
  }
}

Widget _buildLodingScreen() {
  return Container(
    decoration: BoxDecoration(color: Color(0xFF0A2F1D)),
    child: Center(
      child: ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFC5A059),
              Color(0xFFFFD700),
              Color(0xFFD4AF37),
              Color(0xFFFFEEBB),
              Color(0xFFD4AF37),
            ],
          ).createShader(bounds);
        },
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 35.0,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          child: AnimatedTextKit(
            pause: Duration(milliseconds: 1500),
            animatedTexts: [
              TypewriterAnimatedText(tr('loading_screen1')),
              TypewriterAnimatedText(tr('loading_screen2')),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildPageView(BuildContext context) {
  return PageView(
    children: [
      Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                "assets/img2.webp",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFF0A2F1D),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 300,
                          height: context.locale == const Locale('en', 'US')?80:90,
                          child: ShaderMask(
                            shaderCallback: (bounds) {
                              return const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFC5A059),
                                  Color(0xFFFFD700),
                                  Color(0xFFD4AF37),
                                  Color(0xFFFFEEBB),
                                  Color(0xFFD4AF37),
                                ],
                              ).createShader(bounds);
                            },
                            child: Center(
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Schyler',
                                ),
                                child: AnimatedTextKit(
                                  pause: Duration(milliseconds: 80),
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      tr('welcome_screen'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: 250,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                tr('started'),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
