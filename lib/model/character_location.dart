class CharacterLocation {
  final String name;
  final String url;

  CharacterLocation({required this.name, required this.url});

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      CharacterLocation(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
