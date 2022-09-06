import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({Key? key, required this.textName, required this.text})
      : super(key: key);

  final String textName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: textName,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w800),
            children: <TextSpan>[
          TextSpan(
              text: text,
              style: text == 'Dead'
                  ? const TextStyle(color: Colors.red)
                  : const TextStyle(color: Colors.green))
        ]));
  }
}
