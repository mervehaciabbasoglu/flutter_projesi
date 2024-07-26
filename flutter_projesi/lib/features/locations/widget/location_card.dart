import 'package:flutter/material.dart';
import 'package:rick_and_morty3/features/locations/model/location_model.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;

  LocationCard({required this.location, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(location.name),
        subtitle: Text(location.type),
        onTap: onTap,
      ),
    );
  }
}
