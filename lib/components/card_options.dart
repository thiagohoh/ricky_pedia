import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/full_card.dart';
import 'package:ricky_pedia/pages/characters_page.dart';
import 'package:ricky_pedia/pages/locations_page.dart';

class CardOptions extends StatelessWidget {
  const CardOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        crossAxisCount: 1,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 10,
        children: <Widget>[
          FullCard(
            title: 'Characters',
            imageWidget: Image.asset('assets/images/characters.png'),
            onClick: () => {_showCharactersPage(context)},
          ),
          FullCard(
            title: 'Locations',
            imageWidget: Image.asset('assets/images/portal.png'),
            onClick: () => {_showLocationsPage(context)},
          ),
          FullCard(
            title: 'Episodes',
            imageWidget: Image.asset('assets/images/characters.png'),
          )
        ]);
  }
}

void _showCharactersPage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const CharactersPage()));
}

void _showLocationsPage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const Locations()));
}
