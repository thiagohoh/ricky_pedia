import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ricky_pedia/constants/constants.dart';
import 'package:ricky_pedia/model/character.dart';
import 'package:ricky_pedia/model/info.dart';

Future<List<Character>> findAllCharacters({int page = 1}) async {
  final response = await get(Uri.parse(
          '${Constants.baseURL}${Constants.characterEndpoint}?page=$page'))
      .timeout(const Duration(seconds: 20));

  if (response.statusCode == 200) {
    final Map<String, dynamic> res = jsonDecode(response.body);

    final Info inf = Info.fromJson(res['info']);
    List<Map<String, dynamic>> results = List.empty(growable: true);
    results.addAll(List<Map<String, dynamic>>.from(res['results']));

    List<Character> charList =
        List<Character>.from(results.map((e) => Character.fromJson(e)));

    return charList;
  } else {
    return [];
  }
}

Future<Character> randomCharacter() async {
  Random random = Random();
  int randomNumber = random.nextInt(100);
  final response = await get(Uri.parse(
          '${Constants.baseURL}${Constants.characterEndpoint}/$randomNumber'))
      .timeout(const Duration(seconds: 20));

  if (response.statusCode == 200) {
    final Map<String, dynamic> res = jsonDecode(response.body);
    final Character char = Character.fromJson(res);

    return char;
  } else {
    throw Future.error(Exception("Error on get random character."));
  }
}
