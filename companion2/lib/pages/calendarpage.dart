import 'package:companion2/pages/timetablepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatelessWidget {
  final String studentName = "John Doe";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String semester = "1st Semester 2023/2024";

  final List<Map<String, dynamic>> events = [
    {
      "title": "Data Structures Exam",
      "date": DateTime(2024, 8, 15, 9, 0),
      "type": "Exam",
    },
    {
      "title": "Web Development Project Due",
      "date": DateTime(2024, 8, 20, 23, 59),
      "type": "Assignment",
    },
    {
      "title": "Career Fair",
      "date": DateTime(2024, 9, 5, 10, 0),
      "type": "Event",
    },
    // Add more events...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            StudentInfoCard(
              studentName: studentName,
              courseOfStudy: courseOfStudy,
              semester: semester,
              yearOfStudy: '',
            ),
            SizedBox(height: 20),
            Text(
              'Upcoming Events',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...events.map((event) => EventCard(event: event)).toList(),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;

  EventCard({required this.event});

  Color _getEventColor(String type) {
    switch (type) {
      case 'Exam':
        return Colors.red;
      case 'Assignment':
        return Colors.orange;
      case 'Event':
        return Colors.blue;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: 50,
              color: _getEventColor(event['type']),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    DateFormat('MMM d, yyyy - h:mm a').format(event['date']),
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    event['type'],
                    style: TextStyle(
                        fontSize: 14, color: _getEventColor(event['type'])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
