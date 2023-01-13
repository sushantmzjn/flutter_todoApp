import 'package:flutter/material.dart';

class MyAboutDialog extends StatelessWidget {
  const MyAboutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: const Color(0xffadcbd7),
      contentPadding: EdgeInsets.fromLTRB(16.0, 5.0, 10.0, 16.0),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.clear_rounded,
                color: Colors.red,
                size: 30.0,
              ),
            ),
          ]),
          const Text('About', style: TextStyle(fontSize: 25.0)),
          const SizedBox(height: 14.0),
          const Text(
            'ToDo List App is a kind of app that generally used to maintain our day-to-day tasks or list everything that we have to do, with the most important tasks at the top of the list, and the least important tasks at the bottom. It is helpful in planning our daily schedules.',
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 1.0,
            ),
          )
        ],
      ),
    );
  }
}
