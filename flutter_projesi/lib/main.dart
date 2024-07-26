import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty3/product/router/router.dart';
import 'package:rick_and_morty3/features/characters/viewmodel/character_viewmodel.dart';
import 'package:rick_and_morty3/features/locations/viewmodel/location_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterViewModel()),
        ChangeNotifierProvider(create: (_) => LocationViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick and Morty App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
