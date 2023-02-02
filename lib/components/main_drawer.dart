import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  _createItem(
      {required String label,
      required IconData icon,
      required Function() onTap}) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Vamos cozinhar?',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _createItem(
            label: 'Refeições',
            icon: Icons.restaurant,
            onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          _createItem(
            label: 'Configurações',
            icon: Icons.settings,
            onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
          ),
        ],
      ),
    );
  }
}
