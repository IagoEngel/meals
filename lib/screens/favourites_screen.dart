import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../components/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouritesMeals;

  const FavouritesScreen({super.key, required this.favouritesMeals});

  @override
  Widget build(BuildContext context) {
    if (favouritesMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição selecionada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favouritesMeals.length,
        itemBuilder: (context, index) {
          return MealItem(favouritesMeals[index]);
        },
      );
    }
  }
}
