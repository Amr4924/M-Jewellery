// ignore_for_file: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/nav%20bar/Home/notification/notification.dart';
import 'package:loding_screen/widgets/animated_title.dart';

PreferredSizeWidget buildAppBar({
  required int countMessage,
  required VoidCallback clear,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: const Color(0xFF0A2F1D),
    iconTheme: IconThemeData(color: const Color(0xFFC5A059)),
    centerTitle: true,
    title: BuildAnimatedTitle(title: tr('title-home')),
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Notifications(clear: clear),
            ),
          );
        },
        child: SizedBox(
          width: 55,
          height: 55,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.notifications_none, size: 28),

              Positioned(
                top: 4,
                right: 3,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(minHeight: 5, minWidth: 5),
                  child: Text(
                    '${countMessage > 99 ? '99+' : countMessage}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
