import 'package:flutter/material.dart';

import 'utils/app_routes.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.home: (_) => const TabsScreen(),
        AppRoutes.categoriesScreen: (_) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: (_) => const MealDetailsScreen(),
        AppRoutes.settings: (_) => const SettingsScreen(),
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
