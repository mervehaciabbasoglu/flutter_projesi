import 'package:flutter/material.dart';
import 'package:rick_and_morty3/features/locations/model/location_model.dart';
import 'package:rick_and_morty3/features/characters/model/character_model.dart';
import 'package:rick_and_morty3/features/characters/viewmodel/character_viewmodel.dart';
import 'package:provider/provider.dart';

class LocationDetailScreen extends StatelessWidget {
  final Location location;

  LocationDetailScreen({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type: ${location.type}'),
            Text('Dimension: ${location.dimension}'),
            SizedBox(height: 8),
            Text('Residents:'),
            Expanded(
              child: Consumer<CharacterViewModel>(
                builder: (context, viewModel, child) {
                  List<Character> residents = viewModel.characters
                      .where((character) => location.residents.contains(character.url))
                      .toList();

                  return ListView.builder(
                    itemCount: residents.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(residents[index].name),
                        leading: Image.network(residents[index].image),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
