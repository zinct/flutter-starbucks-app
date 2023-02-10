import 'package:flutter/material.dart';

class CustomErrorDialog extends StatelessWidget {
  final String message;
  CustomErrorDialog(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Terjadi Kesalahan"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
