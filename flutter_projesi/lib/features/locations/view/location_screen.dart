import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty3/features/locations/viewmodel/location_viewmodel.dart';
import 'package:rick_and_morty3/features/locations/widget/location_card.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasyonlar'),
      ),
      body: Consumer<LocationViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.locations.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: viewModel.locations.length,
            itemBuilder: (context, index) {
              final location = viewModel.locations[index];
              return LocationCard(
                location: location,
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
