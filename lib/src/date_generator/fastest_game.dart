import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class FastestGame extends StatefulWidget {
  const FastestGame({Key? key}) : super(key: key);

  static const routeName = '/fastest_game';

  @override
  State<FastestGame> createState() => _FastestGameState();
}

class _FastestGameState extends State<FastestGame> {
  int? minutes = 5;
  int timeToEnd = 0;
  bool running = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fastest as you can!'),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    if (!running) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              running = true;
            });
          },
          child: const Text("Start"),
        ),
      );
    }
    return Center();
  }
}
