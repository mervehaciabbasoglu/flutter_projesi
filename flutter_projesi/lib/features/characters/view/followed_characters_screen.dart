import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty3/features/characters/viewmodel/character_viewmodel.dart';
import 'package:rick_and_morty3/features/characters/widget/character_card.dart';

class FollowedCharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takip Edilen Karakterler'),
      ),
      body: Consumer<CharacterViewModel>(
        builder: (context, viewModel, child) {
          final followedCharacters = viewModel.characters.where((character) => character.isFollowed).toList();
          if (followedCharacters.isEmpty) {
            return Center(child: Text('Takip edilen karakter bulunamadı.'));
          }
          return ListView.builder(
            itemCount: followedCharacters.length,
            itemBuilder: (context, index) {
              final character = followedCharacters[index];
              return CharacterCard(
                character: character,
                onTap: () {
                  // Detay sayfasına yönlendir
                },
              );
            },
          );
        },
      ),
    );
  }
}
