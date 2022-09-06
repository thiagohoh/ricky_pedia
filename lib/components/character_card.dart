import 'package:flutter/material.dart';
import 'package:ricky_pedia/model/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.char, this.onClick})
      : super(key: key);

  final Character char;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          debugPrint("opa");
          onClick?.call();
        },
        child: Card(
          color: Colors.white10,
          child: FittedBox(
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(50), // Image radius
                    child: Image.network(char.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.change_history),
                          Text(char.name),
                          const SizedBox(width: 10),
                          Text("Status: ${char.status}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Text(char.location.name),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
