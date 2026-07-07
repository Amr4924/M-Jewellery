import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:loding_screen/nav%20bar/Profile/Widgets/buttom.dart';
import 'package:loding_screen/nav%20bar/Profile/Widgets/data_card.dart';
import 'package:loding_screen/nav%20bar/Profile/language%20screen/language_screen.dart';
import 'package:loding_screen/widgets/animated_title.dart';
import 'package:loding_screen/widgets/department_titles.dart';

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
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 70),
            Divider(height: 40),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              title: Text(tr('log-out')),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2F1D),
        iconTheme: IconThemeData(color: const Color(0xFFC5A059)),
        title: buildAnimatedTitle(title: tr('profile-title')),

        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          buidCardAccount(),
          SizedBox(height: 20),
          buildTitleDepartment(bold: false,title: tr('profile-account-section')),

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
                  buildContainerButtom(
                    context: context,

                    title: tr('profile-manage-profile'),
                    icon: Icons.person_outline,
                  ),
                  buildContainerButtom(
                    context: context,
                    title: tr('profile-password-security'),
                    icon: Icons.lock_outline,
                  ),
                  buildContainerButtom(
                    context: context,
                    title: tr('profile-notifications'),
                    icon: Icons.notifications_outlined,
                  ),
                  buildContainerButtom(
                    context: context,
                    action: appLang,
                    title: tr('profile-app-language'),
                    icon: Icons.translate_rounded,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          buildTitleDepartment(bold: false,title: tr('profile-support-section')),
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
                  buildContainerButtom(
                    context: context,

                    title: tr('profile-help-center'),
                    icon: Icons.help_center_outlined,
                  ),
                  buildContainerButtom(
                    context: context,

                    title: tr('profile-contact-us'),
                    icon: Icons.support_agent,
                  ),
                  buildContainerButtom(
                    context: context,
                    title: tr('profile-report-problem'),
                    icon: Icons.bug_report_outlined,
                  ),
                  buildContainerButtom(
                    context: context,
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
