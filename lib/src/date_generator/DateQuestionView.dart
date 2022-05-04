import 'package:date_generator/src/date_generator/Date.dart';
import 'package:flutter/material.dart';

class DateQuestionItem extends StatefulWidget {
  const DateQuestionItem({Key? key, required this.date}) : super(key: key);

  final Date date;
  @override
  _DateQuestionItemState createState() => _DateQuestionItemState();
}

class _DateQuestionItemState extends State<DateQuestionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Date: ${widget.date.day + 1}/${widget.date.month + 1}/${widget.date.year}",
            textAlign: TextAlign.center,
          ),
          Wrap(
            children: [],
          )
        ],
      ),
    );
  }
}
