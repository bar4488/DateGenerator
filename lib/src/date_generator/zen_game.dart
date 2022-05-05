import 'dart:math';

import 'package:date_generator/src/models/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Displays detailed information about a SampleItem.
class ZenGamePage extends StatefulWidget {
  const ZenGamePage({Key? key}) : super(key: key);

  static const routeName = '/zen_game';

  @override
  State<ZenGamePage> createState() => _ZenGamePageState();
}

class _ZenGamePageState extends State<ZenGamePage> {
  int comboCount = 0;
  int skipCount = 0;
  int correctCount = 0;
  int wrongCount = 0;

  int yearStart = 2022;
  int yearEnd = 2023;

  int page = 1;
  PageController pageController = PageController(initialPage: 1);

  bool showAnswer = false;

  late Date generatedDate;
  Random random = Random();

  @override
  void initState() {
    generatedDate = Date.generated(start: yearStart, end: yearEnd);
    super.initState();
  }

  void toggleSettings() {
    page = (page + 1) % 2;
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer In Zen'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: toggleSettings,
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "start year",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                              decoration:
                                  InputDecoration.collapsed(hintText: "2000"),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                              ],
                              initialValue: yearStart.toString(),
                              onChanged: (val) {
                                setState(() {
                                  yearStart = int.parse(val);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "end year",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                              decoration:
                                  InputDecoration.collapsed(hintText: "2100"),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              initialValue: yearEnd.toString(),
                              onChanged: (val) {
                                setState(() {
                                  yearEnd = int.parse(val);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "correct",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "combo",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "skip",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "wrong",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "$correctCount",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$comboCount",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$skipCount",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$wrongCount",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: buildDateQuestion(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void nextQuestion() {
    setState(() {
      showAnswer = false;
      generatedDate = Date.generated(start: yearStart, end: yearEnd);
    });
  }

  Widget buildDateQuestion(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Date: ${generatedDate.day + 1}/${generatedDate.month + 1}/${generatedDate.year}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 8),
        if (showAnswer)
          Text(
            generatedDate.weekDay.name,
            style: TextStyle(fontSize: 24),
          ),
        answerButton()
      ],
    );
  }

  Widget answerButton() {
    if (showAnswer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                correctCount++;
                comboCount++;
                nextQuestion();
              });
            },
            child: Text("correct"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                comboCount = 0;
                skipCount++;
                nextQuestion();
              });
            },
            child: Text("skip"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                comboCount = 0;
                wrongCount++;
                nextQuestion();
              });
            },
            child: Text("incorrect"),
          ),
        ],
      );
    } else {
      return TextButton(
        onPressed: () => setState(() {
          showAnswer = true;
        }),
        child: Text("show answer"),
      );
    }
  }
}
