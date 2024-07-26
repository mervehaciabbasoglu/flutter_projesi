import 'package:flutter/material.dart';
import 'package:rick_and_morty3/features/characters/model/character_model.dart';
import 'package:rick_and_morty3/product/services/api_service.dart';

class CharacterViewModel extends ChangeNotifier {
  List<Character> characters = [];

  CharacterViewModel() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final result = await ApiService.fetchCharacters();
    characters = result.map((data) => Character.fromJson(data)).toList();
    notifyListeners();
  }
}
