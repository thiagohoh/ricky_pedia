import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(50),
              child: Image.asset('assets/images/loading.gif'),
            ),
          ),
        ],
      ),
    );
  }
}
