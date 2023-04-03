import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(
      {super.key, required this.onSettingsChanged, required this.settings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  title: 'Sem Glúten',
                  subtitle: 'Só exibe receitas sem glúten!',
                  value: settings!.isGlutenFree,
                  onChanged: (value) =>
                      setState(() => settings!.isGlutenFree = value),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibe receitas sem lactose!',
                  value: settings!.isLactoseFree,
                  onChanged: (value) =>
                      setState(() => settings!.isLactoseFree = value),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe receitas veganas!',
                  value: settings!.isVegan,
                  onChanged: (value) =>
                      setState(() => settings!.isVegan = value),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitle: 'Só exibe receitas vegetarianas!',
                  value: settings!.isVegetarian,
                  onChanged: (value) =>
                      setState(() => settings!.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
