import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/Sign%20in/Accounts.dart';
import 'package:loding_screen/Sign%20in/createAccount.dart';

class BuildButtonLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback check;
  final TextEditingController emailsField;
  final TextEditingController passwordsField;
  final bool checkData;
  const BuildButtonLogin({
    super.key,
    required this.formKey,
    required this.check,
    required this.emailsField,
    required this.passwordsField,
    required this.checkData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A2F1D)),
        onPressed: !checkData
            ? null
            : () {
                ScaffoldMessenger.of(context).clearSnackBars(); //
                if (formKey.currentState!.validate()) {
                  // ---- Checking for registered accounts ---------
                  if (AuthManager.registerUsers.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xFF0A2F1D),
                        content: Text(
                          tr("noAccountSignUp"),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        action: SnackBarAction(
                          label: tr('create'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateAccoundScreen(),
                              ),
                            );
                          },
                          textColor: Color(0xFFC5A059),
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  // --------- Data consistency check ---------
                  try {
                    var loggedInUser = AuthManager.registerUsers.firstWhere(
                      (user) =>
                          user.email == emailsField.text.trim() &&
                          user.password == passwordsField.text,
                    );

                    SaveRecord.name = loggedInUser.name;
                    SaveRecord.email = loggedInUser.email;
                    SaveRecord.phone = loggedInUser.phone;

                    check();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xFF0A2F1D),
                        content: Text(
                          tr('invalidData'),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        action: SnackBarAction(
                          label: tr('confirmation'),
                          onPressed: () {},
                          textColor: const Color(0xFFC5A059),
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  // --------- In case of an error in validate ---------
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color(0xFF0A2F1D),
                      content: Text(
                        tr('reviewData'),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      action: SnackBarAction(
                        label: tr('confirmation'),
                        onPressed: () {},
                        textColor: const Color(0xFFC5A059),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
        child: Center(
          child: checkData
              ? Text(
                  tr('login'),
                  style: const TextStyle(
                    color: Color(0xFFC5A059),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                )
              : const CircularProgressIndicator(color: Color(0xFFC5A059)),
        ),
      ),
    );
  }
}