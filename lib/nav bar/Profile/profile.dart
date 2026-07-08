import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:loding_screen/nav%20bar/Profile/Widgets/buttom.dart';
import 'package:loding_screen/nav%20bar/Profile/Widgets/data_card.dart';
import 'package:loding_screen/nav%20bar/Profile/language%20screen/language_screen.dart';
import 'package:loding_screen/widgets/animated_title.dart';
import 'package:loding_screen/widgets/department_titles.dart';
import 'package:loding_screen/widgets/drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void appLang() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LanguageScreen()),
    );
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 235, 235),
      drawer: BuildDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2F1D),
        iconTheme: IconThemeData(color: const Color(0xFFC5A059)),
        title: BuildAnimatedTitle(title: tr('profile-title')),

        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          buidCardAccount(),
          SizedBox(height: 20),
          BuildTitleDepartment(
            bold: false,
            title: tr('profile-account-section'),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  BuildContainerButtom(
                    title: tr('profile-manage-profile'),
                    icon: Icons.person_outline,
                  ),
                  BuildContainerButtom(
                    title: tr('profile-password-security'),
                    icon: Icons.lock_outline,
                  ),
                  BuildContainerButtom(
                    title: tr('profile-notifications'),
                    icon: Icons.notifications_outlined,
                  ),
                  BuildContainerButtom(
                    action: appLang,
                    title: tr('profile-app-language'),
                    icon: Icons.translate_rounded,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          BuildTitleDepartment(
            bold: false,
            title: tr('profile-support-section'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  BuildContainerButtom(
                    title: tr('profile-help-center'),
                    icon: Icons.help_center_outlined,
                  ),
                  BuildContainerButtom(
                    title: tr('profile-contact-us'),
                    icon: Icons.support_agent,
                  ),
                  BuildContainerButtom(
                    title: tr('profile-report-problem'),
                    icon: Icons.bug_report_outlined,
                  ),
                  BuildContainerButtom(
                    title: tr('profile-privacy-policy'),
                    icon: Icons.info_outline,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
