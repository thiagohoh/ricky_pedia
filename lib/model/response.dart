import 'character.dart';
import 'info.dart';

class ResponseChar {
  final Info info;
  final List<String> characters;

  ResponseChar({required this.info, required this.characters});

  factory ResponseChar.fromJson(Map<String, dynamic> json) => ResponseChar(
      info: Info.fromJson(json['info']),
      characters: List<String>.from( json['results'].map((e) => e) )  );
}
