import 'package:exams_app1/custom.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2024, 9, 25): ['Event 1', 'Event 2'],
    DateTime.utc(2024, 9, 26): ['Event 3'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const Text(
                  'My schedule',
                  style: TextStyle(
                    color: Color(0xFF094647),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TableCalendar(
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2040, 12, 31),
                  eventLoader: (day) => _events[day] ?? [],
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Color(0xFF094647),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFFFF914C),
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(color: Color(0xFF094647)),
                    holidayTextStyle: TextStyle(color: Color(0xFF094647)),
                  ),
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      color: Color(0xFF094647),
                      fontWeight: FontWeight.bold,
                    ),
                    formatButtonVisible: false,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Events on the selected date:',
                  style: TextStyle(color: Color(0xFF094647),fontWeight: FontWeight.bold),
                ),
                ..._events[_selectedDay]?.map((event) => Text(event)) ?? [const Text("No Events yet")],
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
