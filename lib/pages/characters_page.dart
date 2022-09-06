import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/character_card.dart';
import 'package:ricky_pedia/components/glassmorphism.dart';
import 'package:ricky_pedia/components/loading.dart';
import 'package:ricky_pedia/components/random_character.dart';
import 'package:ricky_pedia/model/character.dart';
import 'package:ricky_pedia/pages/character_profile_page.dart';
import 'package:ricky_pedia/web/characters_web.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black12,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Stack(children: [
              Image.asset('assets/images/loading.gif'),
              const Glassmorphism(
                  blur: 20, opacity: 0.2, child: RandomCharacter())
            ]),
            const CharactersList()
          ],
        ),
      ),
    );
  }
}

class CharactersList extends StatefulWidget {
  const CharactersList({Key? key}) : super(key: key);

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final ScrollController _scrollController = ScrollController();
  late Future<List<Character>> futureListChar;
  List<Character> charList = List.empty(growable: true);
  bool loading = false;
  int currentPage = 1;
  bool allLoaded = false;

  @override
  void initState() {
    super.initState();
    futureListChar = findAllCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !allLoaded) {
        setState(() {
          currentPage++;

          futureListChar = findAllCharacters(page: currentPage);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white60,
          child: SizedBox(
            height: 550,
            child: FutureBuilder(
                future: futureListChar,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Loading();
                    case ConnectionState.waiting:
                      return const Loading();
                    case ConnectionState.active:
                      return const Text("data");
                    case ConnectionState.done:
                      final List<Character> list =
                          snapshot.data as List<Character>;
                      if (list.isNotEmpty) {
                        charList.addAll(list);
                      }
                      return ListView.builder(
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return CharacterCard(
                            char: charList[index],
                            onClick: () =>
                                {_profilePage(context, charList[index])},
                          );
                        },
                        itemCount: charList.length,
                      );
                  }
                }),
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
