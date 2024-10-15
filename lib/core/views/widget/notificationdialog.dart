import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  final List<String> notifications;

  const NotificationDialog({
    Key? key,
    required this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("الإشعــــارات", style: TextStyle(fontSize: 20)),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                notifications[index],
                style: TextStyle(fontSize: 15),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("موافق"),
        ),
      ],
    );
  }
}

