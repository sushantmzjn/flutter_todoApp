import 'package:flutter/material.dart';
import 'package:todo/utils/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final String myHintText;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    Key? key,
    required this.controller,
    required this.myHintText,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffE1D7C6),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLength: 24,
              controller: controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: myHintText),
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Cancel button
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                  btnColor: Colors.red[600],
                ),
                // Save button
                const SizedBox(
                  width: 10.0,
                ),
                MyButton(
                  text: 'Save',
                  onPressed: onSave,
                  btnColor: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
