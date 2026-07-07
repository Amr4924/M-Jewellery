import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/Sign%20in/Accounts.dart';
import 'package:loding_screen/widgets/animated_title.dart';

class Notifications extends StatefulWidget {
  final VoidCallback clear;
  const Notifications({super.key, required this.clear});
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  static bool isRead = false;
  static List<Map<String, Object>> messages = [
    {
      'title': 'System',
      'message':
          'Welcome, ${SaveRecord.name}, to the \'M Jewellery\' \napp where elegance and sophistication meet.',
      'time': DateFormat('hh:mm a').format(DateTime.now()),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 235, 235),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2F1D),
        iconTheme: IconThemeData(color: const Color(0xFFC5A059)),
        centerTitle: true,
        title: buildAnimatedTitle(title: tr('Notifications')),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isRead = true;
              });
              widget.clear();
            },
            icon: Icon(Icons.done_all),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                messages.clear();
              });
              widget.clear();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: messages.isEmpty
          ? const Center(child: Text('No Notifications'))
          : ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // widget.numberMessage = index + 1;
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: !isRead
                          ? Colors.white
                          : const Color.fromARGB(255, 223, 218, 218),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Sent by: ${messages[index]['title'] as String}',
                              style: TextStyle(
                                color: !isRead
                                    ? Colors.black
                                    : const Color.fromARGB(75, 0, 0, 0),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  messages[index]['message'] as String,
                                  style: TextStyle(
                                    color: !isRead
                                        ? Colors.black
                                        : const Color.fromARGB(75, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                messages[index]['time'] as String,
                                style: TextStyle(
                                  color: !isRead
                                      ? Colors.black
                                      : const Color.fromARGB(75, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
