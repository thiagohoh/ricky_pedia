import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/card_options.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rick Pedia"),
      ),
      body: const SafeArea(child: CardOptions()),
    );
  }
}
