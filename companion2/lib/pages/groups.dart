import 'package:flutter/material.dart';

class GroupsPage extends StatelessWidget {
  final String year = "3rd";
  final String semester = "2nd Semester";
  final String courseOfStudy = "Bachelor of Computer Science";

  final List<Map<String, dynamic>> groups = [
    {
      "groupName": "Algorithm Design Team",
      "members": 5,
      "status": "Active",
      "lastActivity": "2024-08-10"
    },
    {
      "groupName": "Quantum Physics Discussion",
      "members": 8,
      "status": "Inactive",
      "lastActivity": "2024-07-25"
    },
    {
      "groupName": "Database Systems Project",
      "members": 4,
      "status": "Active",
      "lastActivity": "2024-08-15"
    },
    {
      "groupName": "Literature Study Group",
      "members": 6,
      "status": "Active",
      "lastActivity": "2024-08-05"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
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
              'Your Groups',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...groups.map((group) => GroupCard(group: group)).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Create New Group'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement new group creation
                print("Creating new group");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  final Map<String, dynamic> group;

  GroupCard({required this.group});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return Colors.green;
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
                  group['groupName'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(group['status']),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    group['status'],
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Members: ${group['members']}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Last Activity: ${group['lastActivity']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
