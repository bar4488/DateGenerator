import 'package:date_generator/src/models/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateCalculatorWidget extends StatefulWidget {
  const DateCalculatorWidget({Key? key}) : super(key: key);

  @override
  State<DateCalculatorWidget> createState() => _DateCalculatorWidgetState();
}

class _DateCalculatorWidgetState extends State<DateCalculatorWidget> {
  Date date = Date.today();
  Date today = Date.today();
  bool errorDay = false;
  bool errorMonth = false;
  bool errorYear = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.3),
              borderRadius: BorderRadius.circular(32),
            ),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration.collapsed(hintText: "year"),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              initialValue: date.year.toString(),
              onChanged: (val) {
                setState(() {
                  if (int.tryParse(val) != null) {
                    date.year = int.parse(val);
                    errorDay = false;
                  } else {
                    errorYear = true;
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.3),
              borderRadius: BorderRadius.circular(32),
            ),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration.collapsed(hintText: "month"),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              initialValue: (date.month + 1).toString(),
              onChanged: (val) {
                setState(() {
                  if (int.tryParse(val) != null) {
                    date.month = int.parse(val) - 1;
                    errorDay = false;
                  } else {
                    errorMonth = true;
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.3),
              borderRadius: BorderRadius.circular(32),
            ),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration.collapsed(hintText: "day"),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              initialValue: (date.day + 1).toString(),
              onChanged: (val) {
                setState(() {
                  if (int.tryParse(val) != null) {
                    date.day = int.parse(val) - 1;
                    errorDay = false;
                  } else {
                    errorDay = true;
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
            errorDay || errorMonth || errorYear ? "invalid" : date.weekDay.name,
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
