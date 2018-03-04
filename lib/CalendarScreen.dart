import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => new _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  MonthPicker monthPicker;
  DateTime dateTime;
  DateTime currentTime = new DateTime.now();

  @override
  Widget build(BuildContext context) {

    if (dateTime == null) {
      dateTime = new DateTime.now();
    }

    monthPicker = new MonthPicker(selectedDate: dateTime, onChanged: _test, firstDate: currentTime, lastDate: new DateTime(currentTime.year, 12, 31, 0, 0, 0));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Please pick a date"),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            monthPicker,
            new RaisedButton(onPressed: () {
              selectButton(context);
            },
              child: new Text("Select this date"),)
          ],
        ),
      ),
    );

  }

  void selectButton(BuildContext context) {

  }

  void _test(DateTime time) {
    setState(() {
      dateTime = time;
    });
  }
}

