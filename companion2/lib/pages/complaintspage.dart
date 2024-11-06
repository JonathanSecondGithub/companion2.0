import 'package:companion2/pages/timetablepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComplaintsPage extends StatelessWidget {
  final String studentName = "John Doe";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String semester = "1st Semester 2023/2024";

  final List<Map<String, dynamic>> complaints = [
    {
      "id": "C001",
      "title": "Faulty Air Conditioning in LH-01",
      "date": DateTime(2024, 7, 10),
      "status": "Pending",
    },
    {
      "id": "C002",
      "title": "Slow Internet in Dormitory",
      "date": DateTime(2024, 7, 15),
      "status": "In Progress",
    },
    {
      "id": "C003",
      "title": "Parking Shortage",
      "date": DateTime(2024, 7, 20),
      "status": "Resolved",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
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
              'My Complaints',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...complaints
                .map((complaint) => ComplaintCard(complaint: complaint))
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Submit New Complaint'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // TODO: Navigate to new complaint form
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ComplaintCard extends StatelessWidget {
  final Map<String, dynamic> complaint;

  ComplaintCard({required this.complaint});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'In Progress':
        return Colors.blue;
      case 'Resolved':
        return Colors.green;
      default:
        return Colors.grey;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Complaint #${complaint['id']}',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                Chip(
                  label: Text(
                    complaint['status'],
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: _getStatusColor(complaint['status']),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              complaint['title'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Submitted on: ${DateFormat('MMM d, yyyy').format(complaint['date'])}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
