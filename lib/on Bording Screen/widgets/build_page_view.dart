import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/Sign%20in/login/login.dart';

class BuildPageView extends StatelessWidget {
  const BuildPageView({super.key});

  @override
  Widget build(BuildContext context) {
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
                            height: context.locale == const Locale('en', 'US')
                                ? 80
                                : 90,
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
}
