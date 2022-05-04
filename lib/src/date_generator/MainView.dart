import 'package:date_generator/src/date_generator/ZenGame.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'Date.dart';
import 'FastestGame.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, ZenGame.routeName);
              },
              child: const Text("Zen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, FastestGame.routeName);
              },
              child: const Text("Fastest!"),
            ),
          ],
        ),
      ),
    );
  }
}
