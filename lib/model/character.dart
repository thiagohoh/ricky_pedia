import 'package:ricky_pedia/model/character_location.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocation origin;
  final CharacterLocation location;
  final String image;
  final List<String> episodes;
  final String url;
  final DateTime created;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episodes,
      required this.url,
      required this.created})
      : assert(id > 0);

  factory Character.fromJson(Map<String, dynamic> json) => Character(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: CharacterLocation.fromJson(json["origin"]),
      location: CharacterLocation.fromJson(json["location"]),
      image: json["image"],
      episodes: List<String>.from(json["episode"].map((ep) => ep)),
      url: json["url"],
      created: DateTime.parse(json["created"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episodes.map((ep) => ep)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
