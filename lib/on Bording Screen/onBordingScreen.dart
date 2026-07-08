// ignore_for_file: file_names
import 'package:flutter/material.dart';
import "package:easy_localization/easy_localization.dart";
import 'package:loding_screen/on%20Bording%20Screen/widgets/build_page_view.dart';
import 'package:loding_screen/on%20Bording%20Screen/widgets/loding_screen.dart';

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
        child: lodingData ? BuildLodingScreen() : BuildPageView(),
      ),
    );
  }
}
