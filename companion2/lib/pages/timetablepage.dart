import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  final String studentName = "John Doe";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String yearOfStudy = "2nd Year";
  final String semester = "1st Semester";

  final Map<String, List<Map<String, String>>> timetable = {
    "Monday": [
      {"time": "08:00 - 10:00", "subject": "Data Structures", "venue": "LH-01"},
      {
        "time": "11:00 - 13:00",
        "subject": "Database Systems",
        "venue": "CS-Lab-2"
      },
      {"time": "14:00 - 16:00", "subject": "Web Development", "venue": "LH-03"},
    ],
    "Tuesday": [
      {
        "time": "09:00 - 11:00",
        "subject": "Computer Networks",
        "venue": "LH-02"
      },
      {
        "time": "13:00 - 15:00",
        "subject": "Operating Systems",
        "venue": "CS-Lab-1"
      },
    ],
    "Wednesday": [
      {
        "time": "08:00 - 10:00",
        "subject": "Software Engineering",
        "venue": "LH-01"
      },
      {
        "time": "11:00 - 13:00",
        "subject": "Artificial Intelligence",
        "venue": "CS-Lab-3"
      },
    ],
    "Thursday": [
      {"time": "10:00 - 12:00", "subject": "Data Structures", "venue": "LH-01"},
      {
        "time": "14:00 - 16:00",
        "subject": "Database Systems",
        "venue": "CS-Lab-2"
      },
    ],
    "Friday": [
      {
        "time": "09:00 - 11:00",
        "subject": "Computer Networks",
        "venue": "LH-02"
      },
      {"time": "13:00 - 15:00", "subject": "Web Development", "venue": "LH-03"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Timetable'),
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
              yearOfStudy: yearOfStudy,
              semester: semester,
            ),
            SizedBox(height: 20),
            Text(
              'Weekly Timetable',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...timetable.entries
                .map((entry) =>
                    DayTimetableCard(day: entry.key, lessons: entry.value))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  final String studentName;
  final String courseOfStudy;
  final String yearOfStudy;
  final String semester;

  StudentInfoCard({
    required this.studentName,
    required this.courseOfStudy,
    required this.yearOfStudy,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              studentName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              courseOfStudy,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            Text(
              '$yearOfStudy - $semester',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class DayTimetableCard extends StatelessWidget {
  final String day;
  final List<Map<String, String>> lessons;

  DayTimetableCard({required this.day, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: ExpansionTile(
        title: Text(
          day,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        children: lessons.map((lesson) => LessonItem(lesson: lesson)).toList(),
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  final Map<String, String> lesson;

  LessonItem({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        lesson['subject']!,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lesson['time']!,
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          Text(
            'Venue: ${lesson['venue']}',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
      leading: Icon(Icons.class_, color: Colors.white),
    );
  }
}
