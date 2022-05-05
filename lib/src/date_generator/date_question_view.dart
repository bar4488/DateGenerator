import 'package:date_generator/src/models/date.dart';
import 'package:flutter/material.dart';

class DateQuestionItem extends StatefulWidget {
  const DateQuestionItem({Key? key, required this.date, required this.onAnswer})
      : super(key: key);

  final Date date;
  final Function(bool) onAnswer;
  @override
  _DateQuestionItemState createState() => _DateQuestionItemState();
}

class _DateQuestionItemState extends State<DateQuestionItem> {
  bool showAnswer = false;
  late Date date;

  @override
  void initState() {
    date = widget.date;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DateQuestionItem oldWidget) {
    if (widget.date != date) {
      date = widget.date;
      showAnswer = false;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Date: ${widget.date.day + 1}/${widget.date.month + 1}/${widget.date.year}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        if (showAnswer) Text(widget.date.weekDay.name),
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
            onPressed: () => widget.onAnswer(true),
            child: Text("correct"),
          ),
          TextButton(
            onPressed: () => widget.onAnswer(false),
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
