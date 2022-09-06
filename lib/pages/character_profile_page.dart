import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/info_panel.dart';
import 'package:ricky_pedia/model/character.dart';

class CharacterProfilePage extends StatelessWidget {
  const CharacterProfilePage({Key? key, required this.char}) : super(key: key);

  final Character char;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(child: Text("${char.name} Profile")),
      ),
      body: Profile(char: char),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: const [
                BoxShadow(blurRadius: 10),
              ],
              backgroundBlendMode: BlendMode.lighten,
              border: Border.all(color: Colors.black54),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(25),
            child: FittedBox(child: Image.network(image)),
          ),
        ),
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({Key? key, required this.char}) : super(key: key);
  final Character char;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InfoPanel(
        char: char,
        color: Colors.lightGreen,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.char}) : super(key: key);

  final Character char;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ProfileImage(image: char.image), Information(char: char)],
    );
  }
}
