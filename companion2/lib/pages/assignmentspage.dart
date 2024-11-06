import 'package:flutter/material.dart';

class AssignmentsPage extends StatelessWidget {
  final String year = "3rd";
  final String semester = "2nd Semester";
  final String courseOfStudy = "Bachelor of Computer Science";

  final List<Map<String, dynamic>> assignments = [
    {
      "course": "Mathematics",
      "title": "Linear Algebra Problem Set",
      "dueDate": "2024-07-30",
      "status": "Pending"
    },
    {
      "course": "Physics",
      "title": "Quantum Mechanics Essay",
      "dueDate": "2024-08-05",
      "status": "Submitted"
    },
    {
      "course": "Computer Science",
      "title": "Algorithm Design Project",
      "dueDate": "2024-08-15",
      "status": "In Progress"
    },
    {
      "course": "English",
      "title": "Literary Analysis Paper",
      "dueDate": "2024-07-25",
      "status": "Graded"
    },
    {
      "course": "Chemistry",
      "title": "Lab Report: Organic Synthesis",
      "dueDate": "2024-08-10",
      "status": "Pending"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Card(
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
                      courseOfStudy,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Academic Year: $year',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    Text(
                      'Semester: $semester',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Assignments',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...assignments
                .map((assignment) => AssignmentCard(assignment: assignment))
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Create New Assignment'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement new assignment creation
                print("Creating new assignment");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final Map<String, dynamic> assignment;

  AssignmentCard({required this.assignment});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Submitted':
        return Colors.green;
      case 'In Progress':
        return Colors.orange;
      case 'Graded':
        return Colors.blue;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.symmetric(vertical: 8),
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
                  assignment['course'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(assignment['status']),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    assignment['status'],
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              assignment['title'],
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Due: ${assignment['dueDate']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
