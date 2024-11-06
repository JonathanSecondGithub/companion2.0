import 'package:companion2/pages/timetablepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnouncementsPage extends StatelessWidget {
  final String studentName = "John Doe";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String semester = "1st Semester 2023/2024";

  final List<Map<String, dynamic>> announcements = [
    {
      "title": "Midterm Exam Schedule",
      "date": DateTime(2024, 7, 15),
      "content":
          "The midterm exam schedule has been released. Please check the academic portal for details.",
      "priority": "High",
    },
    {
      "title": "Campus Maintenance",
      "date": DateTime(2024, 7, 20),
      "content":
          "The main library will be closed for renovations from July 25 to August 5.",
      "priority": "Medium",
    },
    {
      "title": "New Course Offering",
      "date": DateTime(2024, 7, 22),
      "content":
          "A new elective course on Artificial Intelligence will be offered next semester.",
      "priority": "Low",
    },
    // Add more announcements...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
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
              'Latest Announcements',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...announcements
                .map((announcement) =>
                    AnnouncementCard(announcement: announcement))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final Map<String, dynamic> announcement;

  AnnouncementCard({required this.announcement});

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
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
      child: ExpansionTile(
        title: Text(
          announcement['title'],
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          DateFormat('MMM d, yyyy').format(announcement['date']),
          style: TextStyle(fontSize: 14, color: Colors.white70),
        ),
        leading: Container(
          width: 4,
          height: 50,
          color: _getPriorityColor(announcement['priority']),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              announcement['content'],
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
