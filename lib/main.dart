import 'package:flutter/material.dart';

import 'utils/app_routes.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/settings_screen.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'models/settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favouritesMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        var filterGluten = settings.isGlutenFree && meal.isGlutenFree;
        var filterLactose = settings.isLactoseFree && meal.isLactoseFree;
        var filterVegan = settings.isVegan && meal.isVegan;
        var filterVegetarian = settings.isVegetarian && meal.isVegetarian;

        return filterGluten && filterLactose && filterVegan && filterVegetarian;
      }).toList();
    });
  }

  void _favouriteMeal(Meal meal) {
    setState(() {
      _favouritesMeals.contains(meal)
          ? _favouritesMeals.remove(meal)
          : _favouritesMeals.add(meal);
    });
  }

  bool _isFavourite(Meal meal) {
    return _favouritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.amber,
            ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (_) => TabsScreen(favouritesMeals: _favouritesMeals),
        AppRoutes.categoriesScreen: (_) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.mealDetail: (_) => MealDetailsScreen(
            onToogleFavourite: _favouriteMeal, isFavourite: _isFavourite),
        AppRoutes.settings: (_) =>
            SettingsScreen(onSettingsChanged: _filterMeals, settings: settings),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/rota1') {
      //     return null;
      //   } else if (settings.name == '/rota2') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return const CategoriesScreen();
      //       },
      //     );
      //   }
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const Scaffold(
      //         body: Center(
      //           child: Text('ERROR 404'),
      //         ),
      //       );
      //     },
      //   );
      // },
    );
  }
}
