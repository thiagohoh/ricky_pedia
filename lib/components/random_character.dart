import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/character_card.dart';
import 'package:ricky_pedia/components/loading.dart';
import 'package:ricky_pedia/model/character.dart';
import 'package:ricky_pedia/pages/character_profile_page.dart';
import 'package:ricky_pedia/web/characters_web.dart';

class RandomCharacter extends StatelessWidget {
  const RandomCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 220,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              const Text(
                "Random Character",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              FutureBuilder(
                  future: randomCharacter(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        debugPrint("Connection None");
                        break;
                      case ConnectionState.waiting:
                        return const Loading();
                      case ConnectionState.active:
                        return const Loading();
                      case ConnectionState.done:
                        final Character char = snapshot.data as Character;
                        return Center(
                            child: CharacterCard(
                          char: char,
                          onClick: () => {_profilePage(context, char)},
                        ));
                    }
                    return const Text("Error");
                  })
            ],
          ),
        ),
      ),
    );
  }
}

void _profilePage(BuildContext context, Character character) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CharacterProfilePage(char: character)));
}
