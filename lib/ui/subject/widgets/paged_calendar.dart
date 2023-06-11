import 'package:edtrack/data/models/user/user_attendance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class PagedCalendarScreen extends StatelessWidget {
  const PagedCalendarScreen({
    super.key,
    this.eventDates,
    this.lectures,
  });

  final List<DateTime>? eventDates;
  final List<Lecture>? lectures;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary View', style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: PagedVerticalCalendar(
          initialDate: eventDates!.first,
          minDate: eventDates!.first,
          maxDate: eventDates!.last,
          physics: BouncingScrollPhysics(),
          monthBuilder: (context, month, year) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text(
                DateFormat('MMMM yyyy').format(DateTime(year, month)),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            );
          },
          dayBuilder: (context, date) {
            final eventsThisDay = eventDates!.where((e) => e == date);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat('d').format(date)),
                Wrap(
                  children: eventsThisDay.map((event) {
                    final lecture =
                        lectures!.where((l) => l.absentDate == event).first;

                    return Padding(
                      padding: const EdgeInsets.all(1),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            lecture.isAbsent ? Colors.red : Colors.green,
                      ),
                    );
                  }).toList(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
