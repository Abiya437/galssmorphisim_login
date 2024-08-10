import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'Screens/authentication_screen/signIn_screen.dart';
import 'Screens/authentication_screen/pin_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalendarExample extends StatefulWidget {
  @override
  _CalendarExampleState createState() => _CalendarExampleState();
}

class _CalendarExampleState extends State<CalendarExample> with SingleTickerProviderStateMixin {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _animationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A38),
      appBar: AppBar(
        title: const Text('Table Calendar Example'),
        backgroundColor: const Color(0xFF1F1A38),
      ),
      body: Stack(
        children: [
          // const FlareActor(
          //   "assets/Loading.flr",
          //   animation: "idle",
          //   fit: BoxFit.cover,
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              calendarFormat: _calendarFormat,
              onDaySelected: _onDaySelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                todayDecoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(5, 5),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      offset: const Offset(-5, -5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                todayTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                defaultTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                weekendTextStyle: const TextStyle(
                  color: Colors.red,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                titleTextStyle: const TextStyle(color: Colors.white),
                formatButtonTextStyle: const TextStyle(color: Colors.white),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, _) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(5, 5),
                            blurRadius: 10,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            offset: const Offset(-5, -5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Text(
                        date.day.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                todayBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
                defaultBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
                outsideBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
