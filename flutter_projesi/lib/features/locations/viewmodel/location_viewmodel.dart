import 'package:flutter/material.dart';
import 'package:rick_and_morty3/features/locations/model/location_model.dart';
import 'package:rick_and_morty3/product/services/api_service.dart';

class LocationViewModel extends ChangeNotifier {
  List<Location> locations = [];

  LocationViewModel() {
    fetchLocations();
  }

  Future<void> fetchLocations() async {
    final result = await ApiService.fetchLocations();
    locations = result.map((data) => Location.fromJson(data)).toList();
    notifyListeners();
  }
}
