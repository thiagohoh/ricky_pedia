import 'package:flutter_test/flutter_test.dart';
import 'package:ricky_pedia/model/character.dart';
import 'package:ricky_pedia/model/character_location.dart';

void main() {
  test('Should return a non null character', () {
    final Character character = Character(
        id: 1,
        type: 'type',
        created: DateTime.now(),
        episodes: [],
        gender: 'Male',
        image: '',
        name: 'name',
        origin: CharacterLocation(url: '', name: 'origin'),
        location: CharacterLocation(url: '', name: 'location'),
        species: 'species',
        status: 'status',
        url: '');
    expect(character, isNotNull);
  });

  test('Should return a valid character id', () {
    final Character character = Character(
        id: 1,
        type: 'type',
        created: DateTime.now(),
        episodes: [],
        gender: 'Male',
        image: '',
        name: 'name',
        origin: CharacterLocation(url: '', name: 'origin'),
        location: CharacterLocation(url: '', name: 'location'),
        species: 'species',
        status: 'status',
        url: '');
    expect(character.id, 1);
  });

  test('Should show error when creating a character with id less than zero',
      () {
    expect(
        () => Character(
            id: 0,
            type: 'type',
            created: DateTime.now(),
            episodes: [],
            gender: 'Male',
            image: '',
            name: 'name',
            origin: CharacterLocation(url: '', name: 'origin'),
            location: CharacterLocation(url: '', name: 'location'),
            species: 'species',
            status: 'status',
            url: ''),
        throwsAssertionError);
  });
}
