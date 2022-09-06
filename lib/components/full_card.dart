import 'package:flutter/material.dart';

class FullCard extends StatelessWidget {
  const FullCard(
      {Key? key, required this.title, required this.imageWidget, this.onClick})
      : super(key: key);

  final String title;
  final Widget imageWidget;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onClick?.call();
        },
        child: Card(
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.lightGreen,
              )),
          shadowColor: Colors.deepPurple,
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(170), // Image radius
                    child: imageWidget,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
