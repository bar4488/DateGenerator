import 'dart:math';

import 'package:date_generator/src/date_generator/Date.dart';
import 'package:date_generator/src/date_generator/DateQuestionView.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class ZenGame extends StatefulWidget {
  const ZenGame({Key? key}) : super(key: key);

  static const routeName = '/zen_game';

  @override
  State<ZenGame> createState() => _ZenGameState();
}

class _ZenGameState extends State<ZenGame> {
  int combo = 0;
  int correct = 0;
  int wrong = 0;
  late Date generatedDate;
  Random random = Random();

  @override
  void initState() {
    generatedDate = Date.generated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer In Zen'),
      ),
      body: Center(
        child: DateQuestionItem(date: generatedDate),
      ),
    );
  }
}
