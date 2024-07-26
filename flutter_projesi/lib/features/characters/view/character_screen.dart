import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty3/features/characters/viewmodel/character_viewmodel.dart';
import 'package:rick_and_morty3/features/characters/widget/character_card.dart';

class CharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karakterler'),
      ),
      body: Consumer<CharacterViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.characters.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: viewModel.characters.length,
            itemBuilder: (context, index) {
              final character = viewModel.characters[index];
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
