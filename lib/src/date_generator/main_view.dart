import 'package:date_generator/src/date_generator/date_calculator_widget.dart';
import 'package:date_generator/src/date_generator/zen_game.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import '../models/date.dart';
import 'fastest_game.dart';

/// Displays a list of SampleItems.
class MainView extends StatelessWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose A Game'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DateCalculatorWidget(),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.restorablePushNamed(
                          context, ZenGamePage.routeName);
                    },
                    child: const Text("Zen"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.restorablePushNamed(
                          context, FastestGame.routeName);
                    },
                    child: const Text("Fastest!"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
