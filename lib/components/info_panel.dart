import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/text_info.dart';
import 'package:ricky_pedia/model/character.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({Key? key, required this.char, required this.color})
      : super(key: key);

  final Character char;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(border: Border.all(color: color)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.spaceAround,
                    runSpacing: 20,
                    children: [
                      TextInfo(textName: 'Name: ', text: char.name),
                      TextInfo(textName: 'Status: ', text: char.status),
                      TextInfo(textName: 'Gender: ', text: char.gender),
                      TextInfo(textName: 'Species: ', text: char.species),
                      TextInfo(textName: 'Gender: ', text: char.gender),
                      TextInfo(textName: 'Species: ', text: char.species),
                      TextInfo(textName: 'Origin: ', text: char.origin.name),
                      TextInfo(
                          textName: 'Location: ', text: char.location.name),
                      TextInfo(
                          textName: 'Number of appearance: ',
                          text: char.episodes.length.toString())
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
