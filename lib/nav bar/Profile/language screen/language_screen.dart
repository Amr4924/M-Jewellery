import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/feature/change_language.dart';
import 'package:loding_screen/widgets/animated_title.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 235, 235),

      appBar: AppBar(
        backgroundColor: Color(0xFF0A2F1D),
        iconTheme: IconThemeData(color: const Color(0xFFC5A059)),
        title: BuildAnimatedTitle(title: tr('profile-app-language')),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Center(
            child: InkWell(
              onTap: () {
                toggleTranslation(context);
                Navigator.pop(context);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                height: MediaQuery.of(context).size.width / 7,
                width: context.locale == const Locale('en', 'US')
                    ? MediaQuery.of(context).size.width * 0.75
                    : MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 800),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      tr('change-lang'),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(Icons.language),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
