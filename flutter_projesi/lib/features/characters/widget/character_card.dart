import 'package:flutter/material.dart';
import 'package:rick_and_morty3/features/characters/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  CharacterCard({required this.character, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(character.name),
        subtitle: Text(character.status),
        leading: Image.network(character.image),
        onTap: onTap,
      ),
    );
  }
}
