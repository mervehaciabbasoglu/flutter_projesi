import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty3/features/characters/view/character_screen.dart';
import 'package:rick_and_morty3/features/characters/view/character_detail_screen.dart';
import 'package:rick_and_morty3/features/characters/view/followed_characters_screen.dart';
import 'package:rick_and_morty3/features/locations/view/location_screen.dart';
import 'package:rick_and_morty3/features/onboarding/view/onboarding_screen.dart';
import 'package:rick_and_morty3/features/home/view/home_screen.dart';
import '../../features/characters/model/character_model.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'characters',
          builder: (context, state) => CharacterScreen(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = state.params['id'];
                final character = fetchCharacterById(id!);
                return CharacterDetailScreen(character: character);
              },
            ),
          ],
        ),
        GoRoute(
          path: 'locations',
          builder: (context, state) => LocationScreen(),
        ),
        GoRoute(
          path: 'followed-characters',
          builder: (context, state) => FollowedCharactersScreen(),
        ),
      ],
    ),
  ],
);


Character fetchCharacterById(String id) {
  return Character(
    id: id,
    name: 'Name',
    image: 'image_url',
    status: 'status',
    species: 'species',
    gender: 'gender',
  );
}
